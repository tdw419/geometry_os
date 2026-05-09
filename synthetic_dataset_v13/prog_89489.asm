; DESCRIPTION: Renders a black line between points (343, 223) and (11, 31).
; PLAN: r0=343(x1), r1=223(y1), r2=11(x2), r3=31(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 223
LDI r2, 11
LDI r3, 31
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
