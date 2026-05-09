; DESCRIPTION: Draws a blue line from (270, 111) to (484, 100).
; PLAN: r0=270(x1), r1=111(y1), r2=484(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 111
LDI r2, 484
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
