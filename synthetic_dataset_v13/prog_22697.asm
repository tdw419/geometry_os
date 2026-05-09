; DESCRIPTION: Places a orange line segment connecting (425, 254) to (486, 67).
; PLAN: r0=425(x1), r1=254(y1), r2=486(x2), r3=67(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 254
LDI r2, 486
LDI r3, 67
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
