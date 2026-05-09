; DESCRIPTION: Renders a black line between points (138, 34) and (172, 126).
; PLAN: r0=138(x1), r1=34(y1), r2=172(x2), r3=126(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 34
LDI r2, 172
LDI r3, 126
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
