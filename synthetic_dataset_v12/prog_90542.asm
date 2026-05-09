; DESCRIPTION: Renders a black line between points (31, 17) and (472, 143).
; PLAN: r0=31(x1), r1=17(y1), r2=472(x2), r3=143(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 17
LDI r2, 472
LDI r3, 143
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
