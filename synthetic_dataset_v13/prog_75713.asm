; DESCRIPTION: Places a green line segment connecting (299, 166) to (83, 245).
; PLAN: r0=299(x1), r1=166(y1), r2=83(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 166
LDI r2, 83
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
