; DESCRIPTION: Draws a blue line from (232, 59) to (101, 151).
; PLAN: r0=232(x1), r1=59(y1), r2=101(x2), r3=151(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 59
LDI r2, 101
LDI r3, 151
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
