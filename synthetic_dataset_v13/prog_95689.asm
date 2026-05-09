; DESCRIPTION: Renders a black line between points (432, 192) and (472, 224).
; PLAN: r0=432(x1), r1=192(y1), r2=472(x2), r3=224(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 192
LDI r2, 472
LDI r3, 224
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
