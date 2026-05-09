; DESCRIPTION: Draws a orange line from (108, 134) to (307, 151).
; PLAN: r0=108(x1), r1=134(y1), r2=307(x2), r3=151(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 134
LDI r2, 307
LDI r3, 151
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
