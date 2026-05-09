; DESCRIPTION: Places a orange line segment connecting (450, 39) to (229, 122).
; PLAN: r0=450(x1), r1=39(y1), r2=229(x2), r3=122(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 39
LDI r2, 229
LDI r3, 122
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
