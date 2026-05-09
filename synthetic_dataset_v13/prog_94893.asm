; DESCRIPTION: Places a orange line segment connecting (78, 166) to (467, 21).
; PLAN: r0=78(x1), r1=166(y1), r2=467(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 166
LDI r2, 467
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
