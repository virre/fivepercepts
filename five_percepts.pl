#!/usr/bin/perl 

# Script to output one of the five percept every 15 minutes. 
# To turn it off press 'q'. 
# Created by Virre Annergård, virre.annergard@gmail.com. Feel free to share this. 
# TODO: 
#  Support adding own time for minutes.
#  Bell ringing.
#  GUI support. 
#  Run as daemon in the backend untill percept is shown.

use strict;
use warnings; 
use Time::Localtime;
use Term::ReadKey;

ReadMode 4;
my $key;
(my $sec,my $min,my $hour,my $mday,my $mon,my $year,my $wday,my $yday,my $isdst) = localtime(time);
my @percepts; 

my $start_hour = $hour; 
my $start_minute = $min; 
my $times_shown = 0;
my $mod_minute = $min % 15; 
$percepts[0] = 'Aware of the suffering caused by the destruction of life, I vow to cultivate compassion and learn ways to protect the lives of all sentient beings.  I am determined not to kill, not to let others kill, and not to condone any act of killing in the world, in my thinking, and in my way of life.'; 
$percepts[1] = 'Aware of the suffering caused by exploitation, social injustice, stealing, and oppression, I vow to cultivate loving kindness and learn ways to work for the well-being of all sentient beings.  I vow to practice generosity by sharing my time, energy, and material resources with those who are in real need.  I am determined not to steal and not to possess anything that should belong to others.  I will respect the property of others, but I will prevent others from profiting from human suffering or the suffering of other species on Earth.';
$percepts[2] = 'Aware of the suffering caused by sexual misconduct, I vow to cultivate responsibility and learn ways to protect the safety and integrity of individuals, couples, families, and society.  I am determined not to engage in sexual relations without love and a long-term commitment.  To preserve the happiness of myself and others, I am determined to respect my commitments and the commitments of others.  I will do everything in my power to protect children from sexual abuse and to prevent couples and families from being broken by sexual misconduct.';
$percepts[3] = 'Aware of the suffering caused by unmindful speech and the inability to listen to others, I vow to cultivate loving speech and deep listening in order to bring joy and happiness to others and relieve others of their suffering.  Knowing that words can create happiness or suffering, I vow to learn to speak truthfully, with words that inspire self-confidence, joy, and hope.  I am determined not to spread news that I do not know to be certain and not to criticize or condemn things of which I am not sure.  I will refrain from uttering words that can cause division or discord, or that can cause the family or the community to break.  I will make all efforts to reconcile and resolve all conflicts, however small.'; 
$percepts[4] = 'Aware of the suffering caused by unmindful consumption, I vow to cultivate good health, both physical and mental, for myself, my family and my society, by practicing mindful eating, drinking, and consuming.  I vow to ingest only items that preserve peace, well-being, and joy in my body, in my consciousness, and in the collective body and consciousness of my family and society.  I am determined not to use alcohol or any other intoxicant, or to ingest foods or other items that contain toxins, such as certain TV programs, magazines, books, films, and conversations.  I am aware that to damage my body or my consciousness with these poisons is to betray my ancestors, my parents, my society, and future generations.  I will work to transform violence, fear, anger, and confusion in myself and in society by practicing a diet for myself and for society.   I understand that a proper diet is crucial for self-transformation and for the transformation of society.'; 
my $percept = int(rand(4));
my $latest = 6;

#Loop through till Q is pressed.
while ( lc($key) ne "q" ) {
	$key = ReadKey(-1);
	($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime(time);
    $percept = int(rand(4));     
    if ($start_minute eq $min || $min % 15 eq $mod_minute) {
		if ($times_shown ne 1 && $percept != $latest) {
			print "$percepts[$percept]\n"; 
			$times_shown = 1;
			$latest = $percept;
		}
    }
    else {
		$times_shown = 0;
    }
}
;