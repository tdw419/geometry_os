; DESCRIPTION: Renders a white line between points (444, 232) and (366, 147).
; PLAN: r0=444(x1), r1=232(y1), r2=366(x2), r3=147(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 232
LDI r2, 366
LDI r3, 147
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
