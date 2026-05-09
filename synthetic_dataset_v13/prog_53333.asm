; DESCRIPTION: Renders a black line between points (134, 159) and (325, 21).
; PLAN: r0=134(x1), r1=159(y1), r2=325(x2), r3=21(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 159
LDI r2, 325
LDI r3, 21
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
