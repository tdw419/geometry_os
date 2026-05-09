; DESCRIPTION: Renders a black line between points (33, 66) and (68, 147).
; PLAN: r0=33(x1), r1=66(y1), r2=68(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 66
LDI r2, 68
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
