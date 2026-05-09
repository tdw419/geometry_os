; DESCRIPTION: Renders a black line between points (66, 140) and (420, 116).
; PLAN: r0=66(x1), r1=140(y1), r2=420(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 140
LDI r2, 420
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
