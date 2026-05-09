; DESCRIPTION: Renders a purple line between points (84, 96) and (69, 140).
; PLAN: r0=84(x1), r1=96(y1), r2=69(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 96
LDI r2, 69
LDI r3, 140
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
