; DESCRIPTION: Renders a purple line between points (453, 107) and (137, 193).
; PLAN: r0=453(x1), r1=107(y1), r2=137(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 107
LDI r2, 137
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
