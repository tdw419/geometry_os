; DESCRIPTION: Places a orange line segment connecting (91, 185) to (39, 12).
; PLAN: r0=91(x1), r1=185(y1), r2=39(x2), r3=12(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 185
LDI r2, 39
LDI r3, 12
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
