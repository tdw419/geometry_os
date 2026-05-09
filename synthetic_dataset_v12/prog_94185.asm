; DESCRIPTION: Renders a yellow line between points (316, 85) and (329, 194).
; PLAN: r0=316(x1), r1=85(y1), r2=329(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 85
LDI r2, 329
LDI r3, 194
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
