; DESCRIPTION: Places a blue line segment connecting (109, 245) to (294, 245).
; PLAN: r0=109(x1), r1=245(y1), r2=294(x2), r3=245(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 245
LDI r2, 294
LDI r3, 245
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
