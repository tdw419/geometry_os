; DESCRIPTION: Renders a black line between points (211, 37) and (31, 248).
; PLAN: r0=211(x1), r1=37(y1), r2=31(x2), r3=248(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 37
LDI r2, 31
LDI r3, 248
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
