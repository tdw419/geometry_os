; DESCRIPTION: Places a orange line segment connecting (59, 41) to (405, 211).
; PLAN: r0=59(x1), r1=41(y1), r2=405(x2), r3=211(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 41
LDI r2, 405
LDI r3, 211
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
