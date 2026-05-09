; DESCRIPTION: Renders a yellow line between points (37, 253) and (316, 120).
; PLAN: r0=37(x1), r1=253(y1), r2=316(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 253
LDI r2, 316
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
