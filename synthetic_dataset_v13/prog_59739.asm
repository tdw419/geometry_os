; DESCRIPTION: Renders a purple line between points (12, 250) and (455, 56).
; PLAN: r0=12(x1), r1=250(y1), r2=455(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 250
LDI r2, 455
LDI r3, 56
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
