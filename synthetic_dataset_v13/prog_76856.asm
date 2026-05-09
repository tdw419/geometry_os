; DESCRIPTION: Renders a black line between points (247, 159) and (172, 237).
; PLAN: r0=247(x1), r1=159(y1), r2=172(x2), r3=237(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 159
LDI r2, 172
LDI r3, 237
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
