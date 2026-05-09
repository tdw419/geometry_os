; DESCRIPTION: Places a orange line segment connecting (391, 135) to (31, 8).
; PLAN: r0=391(x1), r1=135(y1), r2=31(x2), r3=8(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 135
LDI r2, 31
LDI r3, 8
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
