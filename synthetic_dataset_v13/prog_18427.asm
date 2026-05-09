; DESCRIPTION: Renders a orange line between points (18, 175) and (459, 252).
; PLAN: r0=18(x1), r1=175(y1), r2=459(x2), r3=252(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 175
LDI r2, 459
LDI r3, 252
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
