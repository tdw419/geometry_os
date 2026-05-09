; DESCRIPTION: Renders a orange line between points (336, 114) and (343, 95).
; PLAN: r0=336(x1), r1=114(y1), r2=343(x2), r3=95(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 114
LDI r2, 343
LDI r3, 95
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
