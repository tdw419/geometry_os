; DESCRIPTION: Places a orange line segment connecting (405, 0) to (130, 94).
; PLAN: r0=405(x1), r1=0(y1), r2=130(x2), r3=94(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 0
LDI r2, 130
LDI r3, 94
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
