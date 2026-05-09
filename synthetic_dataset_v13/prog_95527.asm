; DESCRIPTION: Draws a magenta line from (359, 39) to (370, 151).
; PLAN: r0=359(x1), r1=39(y1), r2=370(x2), r3=151(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 39
LDI r2, 370
LDI r3, 151
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
