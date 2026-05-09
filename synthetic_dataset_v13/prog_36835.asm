; DESCRIPTION: Renders a red line between points (116, 203) and (498, 22).
; PLAN: r0=116(x1), r1=203(y1), r2=498(x2), r3=22(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 203
LDI r2, 498
LDI r3, 22
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
