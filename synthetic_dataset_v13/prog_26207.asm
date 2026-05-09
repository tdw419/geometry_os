; DESCRIPTION: Renders a purple line between points (49, 147) and (340, 86).
; PLAN: r0=49(x1), r1=147(y1), r2=340(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 147
LDI r2, 340
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
