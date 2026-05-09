; DESCRIPTION: Renders a black line between points (87, 78) and (249, 129).
; PLAN: r0=87(x1), r1=78(y1), r2=249(x2), r3=129(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 78
LDI r2, 249
LDI r3, 129
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
