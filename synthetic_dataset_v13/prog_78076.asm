; DESCRIPTION: Renders a purple line between points (454, 11) and (134, 175).
; PLAN: r0=454(x1), r1=11(y1), r2=134(x2), r3=175(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 11
LDI r2, 134
LDI r3, 175
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
