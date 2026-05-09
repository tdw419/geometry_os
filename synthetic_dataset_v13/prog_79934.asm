; DESCRIPTION: Renders a blue line between points (316, 156) and (88, 195).
; PLAN: r0=316(x1), r1=156(y1), r2=88(x2), r3=195(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 156
LDI r2, 88
LDI r3, 195
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
