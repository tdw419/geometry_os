; DESCRIPTION: Places a yellow line segment connecting (297, 100) to (469, 176).
; PLAN: r0=297(x1), r1=100(y1), r2=469(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 100
LDI r2, 469
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
