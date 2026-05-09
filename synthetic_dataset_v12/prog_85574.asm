; DESCRIPTION: Renders a purple line between points (71, 46) and (325, 211).
; PLAN: r0=71(x1), r1=46(y1), r2=325(x2), r3=211(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 46
LDI r2, 325
LDI r3, 211
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
