; DESCRIPTION: Places a white line segment connecting (314, 76) to (494, 140).
; PLAN: r0=314(x1), r1=76(y1), r2=494(x2), r3=140(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 76
LDI r2, 494
LDI r3, 140
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
