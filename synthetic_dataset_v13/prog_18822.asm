; DESCRIPTION: Places a cyan line segment connecting (218, 185) to (163, 104).
; PLAN: r0=218(x1), r1=185(y1), r2=163(x2), r3=104(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 185
LDI r2, 163
LDI r3, 104
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
