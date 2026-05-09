; DESCRIPTION: Renders a black line between points (427, 252) and (130, 129).
; PLAN: r0=427(x1), r1=252(y1), r2=130(x2), r3=129(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 252
LDI r2, 130
LDI r3, 129
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
