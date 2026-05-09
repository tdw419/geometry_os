; DESCRIPTION: Renders a black line between points (247, 70) and (310, 116).
; PLAN: r0=247(x1), r1=70(y1), r2=310(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 70
LDI r2, 310
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
