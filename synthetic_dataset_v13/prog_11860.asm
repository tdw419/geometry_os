; DESCRIPTION: Renders a blue line between points (311, 240) and (390, 175).
; PLAN: r0=311(x1), r1=240(y1), r2=390(x2), r3=175(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 240
LDI r2, 390
LDI r3, 175
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
