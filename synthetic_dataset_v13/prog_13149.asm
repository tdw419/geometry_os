; DESCRIPTION: Places a red line segment connecting (429, 245) to (331, 9).
; PLAN: r0=429(x1), r1=245(y1), r2=331(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 245
LDI r2, 331
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
