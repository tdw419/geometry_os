; DESCRIPTION: Places a green line segment connecting (99, 175) to (301, 106).
; PLAN: r0=99(x1), r1=175(y1), r2=301(x2), r3=106(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 175
LDI r2, 301
LDI r3, 106
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
