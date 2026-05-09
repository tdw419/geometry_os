; DESCRIPTION: Renders a yellow line between points (498, 203) and (328, 15).
; PLAN: r0=498(x1), r1=203(y1), r2=328(x2), r3=15(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 203
LDI r2, 328
LDI r3, 15
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
