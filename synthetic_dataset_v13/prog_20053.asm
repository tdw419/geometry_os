; DESCRIPTION: Renders a yellow line between points (376, 4) and (427, 140).
; PLAN: r0=376(x1), r1=4(y1), r2=427(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 4
LDI r2, 427
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
