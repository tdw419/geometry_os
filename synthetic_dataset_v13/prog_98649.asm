; DESCRIPTION: Places a orange line segment connecting (66, 15) to (282, 189).
; PLAN: r0=66(x1), r1=15(y1), r2=282(x2), r3=189(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 15
LDI r2, 282
LDI r3, 189
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
