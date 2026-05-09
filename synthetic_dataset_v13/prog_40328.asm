; DESCRIPTION: Places a white line segment connecting (475, 218) to (364, 238).
; PLAN: r0=475(x1), r1=218(y1), r2=364(x2), r3=238(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 218
LDI r2, 364
LDI r3, 238
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
