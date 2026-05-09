; DESCRIPTION: Renders a black line between points (211, 128) and (318, 43).
; PLAN: r0=211(x1), r1=128(y1), r2=318(x2), r3=43(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 128
LDI r2, 318
LDI r3, 43
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
