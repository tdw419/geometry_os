; DESCRIPTION: Places a orange line segment connecting (319, 163) to (162, 86).
; PLAN: r0=319(x1), r1=163(y1), r2=162(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 163
LDI r2, 162
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
