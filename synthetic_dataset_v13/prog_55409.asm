; DESCRIPTION: Renders a black line between points (486, 253) and (119, 227).
; PLAN: r0=486(x1), r1=253(y1), r2=119(x2), r3=227(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 253
LDI r2, 119
LDI r3, 227
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
