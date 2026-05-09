; DESCRIPTION: Renders a purple line between points (399, 135) and (343, 62).
; PLAN: r0=399(x1), r1=135(y1), r2=343(x2), r3=62(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 135
LDI r2, 343
LDI r3, 62
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
