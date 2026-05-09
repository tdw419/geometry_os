; DESCRIPTION: Renders a orange line between points (162, 100) and (413, 104).
; PLAN: r0=162(x1), r1=100(y1), r2=413(x2), r3=104(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 100
LDI r2, 413
LDI r3, 104
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
