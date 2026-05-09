; DESCRIPTION: Places a cyan line segment connecting (163, 83) to (46, 218).
; PLAN: r0=163(x1), r1=83(y1), r2=46(x2), r3=218(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 83
LDI r2, 46
LDI r3, 218
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
