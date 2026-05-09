; DESCRIPTION: Renders a orange line between points (179, 183) and (344, 102).
; PLAN: r0=179(x1), r1=183(y1), r2=344(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 183
LDI r2, 344
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
