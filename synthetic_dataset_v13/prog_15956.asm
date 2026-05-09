; DESCRIPTION: Renders a black line between points (199, 143) and (483, 123).
; PLAN: r0=199(x1), r1=143(y1), r2=483(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 143
LDI r2, 483
LDI r3, 123
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
