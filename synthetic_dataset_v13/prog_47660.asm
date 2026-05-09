; DESCRIPTION: Places a orange line segment connecting (6, 10) to (65, 63).
; PLAN: r0=6(x1), r1=10(y1), r2=65(x2), r3=63(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 10
LDI r2, 65
LDI r3, 63
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
