; DESCRIPTION: Places a red line segment connecting (265, 37) to (501, 245).
; PLAN: r0=265(x1), r1=37(y1), r2=501(x2), r3=245(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 37
LDI r2, 501
LDI r3, 245
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
