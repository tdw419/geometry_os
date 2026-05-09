; DESCRIPTION: Renders a orange line between points (328, 166) and (344, 251).
; PLAN: r0=328(x1), r1=166(y1), r2=344(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 166
LDI r2, 344
LDI r3, 251
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
