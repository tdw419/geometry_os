; DESCRIPTION: Renders a black line between points (40, 196) and (432, 116).
; PLAN: r0=40(x1), r1=196(y1), r2=432(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 196
LDI r2, 432
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
