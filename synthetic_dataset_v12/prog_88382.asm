; DESCRIPTION: Renders a black line between points (402, 91) and (343, 237).
; PLAN: r0=402(x1), r1=91(y1), r2=343(x2), r3=237(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 91
LDI r2, 343
LDI r3, 237
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
