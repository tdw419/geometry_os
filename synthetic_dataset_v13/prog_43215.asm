; DESCRIPTION: Places a orange line segment connecting (24, 10) to (265, 20).
; PLAN: r0=24(x1), r1=10(y1), r2=265(x2), r3=20(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 10
LDI r2, 265
LDI r3, 20
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
