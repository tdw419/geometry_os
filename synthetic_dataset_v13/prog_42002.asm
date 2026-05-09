; DESCRIPTION: Places a blue line segment connecting (18, 96) to (188, 163).
; PLAN: r0=18(x1), r1=96(y1), r2=188(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 96
LDI r2, 188
LDI r3, 163
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
