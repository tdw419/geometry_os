; DESCRIPTION: Places a green line segment connecting (406, 61) to (45, 175).
; PLAN: r0=406(x1), r1=61(y1), r2=45(x2), r3=175(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 61
LDI r2, 45
LDI r3, 175
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
