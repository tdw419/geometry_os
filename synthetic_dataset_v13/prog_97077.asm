; DESCRIPTION: Renders a orange line between points (416, 166) and (316, 17).
; PLAN: r0=416(x1), r1=166(y1), r2=316(x2), r3=17(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 166
LDI r2, 316
LDI r3, 17
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
