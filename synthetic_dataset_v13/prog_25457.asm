; DESCRIPTION: Renders a black line between points (159, 34) and (365, 77).
; PLAN: r0=159(x1), r1=34(y1), r2=365(x2), r3=77(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 34
LDI r2, 365
LDI r3, 77
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
