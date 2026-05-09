; DESCRIPTION: Renders a black line between points (302, 29) and (312, 176).
; PLAN: r0=302(x1), r1=29(y1), r2=312(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 29
LDI r2, 312
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
