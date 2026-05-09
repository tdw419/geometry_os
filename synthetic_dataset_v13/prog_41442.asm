; DESCRIPTION: Renders a black line between points (381, 71) and (76, 88).
; PLAN: r0=381(x1), r1=71(y1), r2=76(x2), r3=88(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 71
LDI r2, 76
LDI r3, 88
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
