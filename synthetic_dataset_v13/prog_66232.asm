; DESCRIPTION: Places a cyan line segment connecting (334, 2) to (131, 34).
; PLAN: r0=334(x1), r1=2(y1), r2=131(x2), r3=34(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 2
LDI r2, 131
LDI r3, 34
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
