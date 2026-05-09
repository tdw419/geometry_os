; DESCRIPTION: Renders a orange line between points (25, 9) and (14, 162).
; PLAN: r0=25(x1), r1=9(y1), r2=14(x2), r3=162(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 9
LDI r2, 14
LDI r3, 162
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
