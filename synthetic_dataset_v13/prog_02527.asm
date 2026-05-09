; DESCRIPTION: Places a green line segment connecting (304, 139) to (469, 145).
; PLAN: r0=304(x1), r1=139(y1), r2=469(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 139
LDI r2, 469
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
