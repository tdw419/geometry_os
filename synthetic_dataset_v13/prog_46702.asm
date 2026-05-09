; DESCRIPTION: Renders a black line between points (351, 149) and (414, 144).
; PLAN: r0=351(x1), r1=149(y1), r2=414(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 149
LDI r2, 414
LDI r3, 144
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
