; DESCRIPTION: Places a cyan line segment connecting (139, 31) to (407, 45).
; PLAN: r0=139(x1), r1=31(y1), r2=407(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 31
LDI r2, 407
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
