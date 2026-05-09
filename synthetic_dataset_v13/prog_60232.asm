; DESCRIPTION: Places a cyan line segment connecting (496, 21) to (339, 92).
; PLAN: r0=496(x1), r1=21(y1), r2=339(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 21
LDI r2, 339
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
