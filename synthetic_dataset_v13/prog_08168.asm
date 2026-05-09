; DESCRIPTION: Renders a black line between points (463, 58) and (64, 116).
; PLAN: r0=463(x1), r1=58(y1), r2=64(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 58
LDI r2, 64
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
