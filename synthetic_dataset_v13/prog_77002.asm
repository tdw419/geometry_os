; DESCRIPTION: Draws a red line from (511, 91) to (479, 151).
; PLAN: r0=511(x1), r1=91(y1), r2=479(x2), r3=151(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 91
LDI r2, 479
LDI r3, 151
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
