; DESCRIPTION: Places a orange line segment connecting (221, 166) to (438, 204).
; PLAN: r0=221(x1), r1=166(y1), r2=438(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 166
LDI r2, 438
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
