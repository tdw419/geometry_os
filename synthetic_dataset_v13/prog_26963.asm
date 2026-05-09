; DESCRIPTION: Renders a yellow line between points (211, 30) and (343, 95).
; PLAN: r0=211(x1), r1=30(y1), r2=343(x2), r3=95(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 30
LDI r2, 343
LDI r3, 95
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
