; DESCRIPTION: Renders a yellow line between points (282, 22) and (253, 130).
; PLAN: r0=282(x1), r1=22(y1), r2=253(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 22
LDI r2, 253
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
