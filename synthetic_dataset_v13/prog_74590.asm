; DESCRIPTION: Renders a black line between points (217, 246) and (399, 238).
; PLAN: r0=217(x1), r1=246(y1), r2=399(x2), r3=238(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 246
LDI r2, 399
LDI r3, 238
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
