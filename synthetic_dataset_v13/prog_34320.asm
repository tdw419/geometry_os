; DESCRIPTION: Renders a black line between points (172, 218) and (136, 135).
; PLAN: r0=172(x1), r1=218(y1), r2=136(x2), r3=135(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 218
LDI r2, 136
LDI r3, 135
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
