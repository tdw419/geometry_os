; DESCRIPTION: Renders a green line between points (282, 158) and (316, 216).
; PLAN: r0=282(x1), r1=158(y1), r2=316(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 158
LDI r2, 316
LDI r3, 216
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
