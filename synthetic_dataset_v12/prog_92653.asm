; DESCRIPTION: Places a green line segment connecting (31, 104) to (76, 156).
; PLAN: r0=31(x1), r1=104(y1), r2=76(x2), r3=156(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 104
LDI r2, 76
LDI r3, 156
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
