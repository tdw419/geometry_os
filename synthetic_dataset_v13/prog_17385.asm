; DESCRIPTION: Draws a purple line from (0, 67) to (359, 151).
; PLAN: r0=0(x1), r1=67(y1), r2=359(x2), r3=151(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 67
LDI r2, 359
LDI r3, 151
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
