; DESCRIPTION: Places a blue line segment connecting (20, 145) to (188, 93).
; PLAN: r0=20(x1), r1=145(y1), r2=188(x2), r3=93(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 145
LDI r2, 188
LDI r3, 93
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
