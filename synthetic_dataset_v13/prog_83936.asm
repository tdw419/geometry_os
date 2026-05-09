; DESCRIPTION: Places a orange line segment connecting (265, 211) to (127, 110).
; PLAN: r0=265(x1), r1=211(y1), r2=127(x2), r3=110(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 211
LDI r2, 127
LDI r3, 110
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
