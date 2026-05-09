; DESCRIPTION: Renders a purple line between points (492, 11) and (132, 250).
; PLAN: r0=492(x1), r1=11(y1), r2=132(x2), r3=250(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 11
LDI r2, 132
LDI r3, 250
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
