; DESCRIPTION: Renders a white line between points (179, 123) and (78, 176).
; PLAN: r0=179(x1), r1=123(y1), r2=78(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 123
LDI r2, 78
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
