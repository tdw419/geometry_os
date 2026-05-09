; DESCRIPTION: Renders a orange line between points (253, 147) and (337, 124).
; PLAN: r0=253(x1), r1=147(y1), r2=337(x2), r3=124(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 147
LDI r2, 337
LDI r3, 124
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
