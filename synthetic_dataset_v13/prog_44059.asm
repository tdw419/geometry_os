; DESCRIPTION: Renders a black line between points (147, 105) and (85, 111).
; PLAN: r0=147(x1), r1=105(y1), r2=85(x2), r3=111(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 105
LDI r2, 85
LDI r3, 111
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
