; DESCRIPTION: Renders a purple line between points (427, 240) and (225, 3).
; PLAN: r0=427(x1), r1=240(y1), r2=225(x2), r3=3(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 240
LDI r2, 225
LDI r3, 3
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
