; DESCRIPTION: Places a orange line segment connecting (473, 0) to (289, 163).
; PLAN: r0=473(x1), r1=0(y1), r2=289(x2), r3=163(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 0
LDI r2, 289
LDI r3, 163
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
