; DESCRIPTION: Renders a black line between points (427, 174) and (139, 81).
; PLAN: r0=427(x1), r1=174(y1), r2=139(x2), r3=81(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 174
LDI r2, 139
LDI r3, 81
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
