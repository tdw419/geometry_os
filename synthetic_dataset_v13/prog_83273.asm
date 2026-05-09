; DESCRIPTION: Places a orange line segment connecting (65, 183) to (13, 5).
; PLAN: r0=65(x1), r1=183(y1), r2=13(x2), r3=5(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 183
LDI r2, 13
LDI r3, 5
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
