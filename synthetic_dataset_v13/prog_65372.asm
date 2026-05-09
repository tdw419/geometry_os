; DESCRIPTION: Places a orange line segment connecting (334, 31) to (425, 221).
; PLAN: r0=334(x1), r1=31(y1), r2=425(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 31
LDI r2, 425
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
