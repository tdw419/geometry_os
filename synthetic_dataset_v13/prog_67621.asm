; DESCRIPTION: Renders a white line between points (216, 253) and (56, 147).
; PLAN: r0=216(x1), r1=253(y1), r2=56(x2), r3=147(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 253
LDI r2, 56
LDI r3, 147
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
