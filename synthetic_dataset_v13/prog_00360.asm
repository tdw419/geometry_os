; DESCRIPTION: Places a cyan line segment connecting (431, 56) to (390, 205).
; PLAN: r0=431(x1), r1=56(y1), r2=390(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 56
LDI r2, 390
LDI r3, 205
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
