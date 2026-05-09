; DESCRIPTION: Renders a black line between points (89, 129) and (361, 22).
; PLAN: r0=89(x1), r1=129(y1), r2=361(x2), r3=22(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 129
LDI r2, 361
LDI r3, 22
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
