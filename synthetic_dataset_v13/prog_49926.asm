; DESCRIPTION: Places a cyan line segment connecting (189, 23) to (334, 10).
; PLAN: r0=189(x1), r1=23(y1), r2=334(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 23
LDI r2, 334
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
