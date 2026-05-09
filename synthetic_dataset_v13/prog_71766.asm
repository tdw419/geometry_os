; DESCRIPTION: Places a orange line segment connecting (268, 23) to (186, 40).
; PLAN: r0=268(x1), r1=23(y1), r2=186(x2), r3=40(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 23
LDI r2, 186
LDI r3, 40
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
