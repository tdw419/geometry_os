; DESCRIPTION: Renders a black line between points (471, 78) and (358, 172).
; PLAN: r0=471(x1), r1=78(y1), r2=358(x2), r3=172(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 78
LDI r2, 358
LDI r3, 172
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
