; DESCRIPTION: Places a cyan line segment connecting (204, 92) to (496, 15).
; PLAN: r0=204(x1), r1=92(y1), r2=496(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 92
LDI r2, 496
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
