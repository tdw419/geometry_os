; DESCRIPTION: Places a white line segment connecting (494, 76) to (457, 156).
; PLAN: r0=494(x1), r1=76(y1), r2=457(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 76
LDI r2, 457
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
