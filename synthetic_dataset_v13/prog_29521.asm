; DESCRIPTION: Places a orange line segment connecting (423, 166) to (434, 106).
; PLAN: r0=423(x1), r1=166(y1), r2=434(x2), r3=106(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 166
LDI r2, 434
LDI r3, 106
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
