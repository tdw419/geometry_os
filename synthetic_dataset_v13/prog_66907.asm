; DESCRIPTION: Places a green line segment connecting (431, 88) to (301, 86).
; PLAN: r0=431(x1), r1=88(y1), r2=301(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 88
LDI r2, 301
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
