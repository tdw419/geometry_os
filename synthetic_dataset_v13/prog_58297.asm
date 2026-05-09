; DESCRIPTION: Renders a black line between points (453, 161) and (253, 5).
; PLAN: r0=453(x1), r1=161(y1), r2=253(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 161
LDI r2, 253
LDI r3, 5
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
