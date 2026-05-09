; DESCRIPTION: Renders a black line between points (34, 52) and (13, 159).
; PLAN: r0=34(x1), r1=52(y1), r2=13(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 52
LDI r2, 13
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
