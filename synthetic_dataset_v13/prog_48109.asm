; DESCRIPTION: Places a orange line segment connecting (367, 56) to (290, 19).
; PLAN: r0=367(x1), r1=56(y1), r2=290(x2), r3=19(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 56
LDI r2, 290
LDI r3, 19
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
