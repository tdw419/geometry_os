; DESCRIPTION: Renders a black line between points (505, 129) and (8, 234).
; PLAN: r0=505(x1), r1=129(y1), r2=8(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 129
LDI r2, 8
LDI r3, 234
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
