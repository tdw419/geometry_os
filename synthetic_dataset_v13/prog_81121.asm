; DESCRIPTION: Renders a red line between points (498, 137) and (105, 114).
; PLAN: r0=498(x1), r1=137(y1), r2=105(x2), r3=114(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 137
LDI r2, 105
LDI r3, 114
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
