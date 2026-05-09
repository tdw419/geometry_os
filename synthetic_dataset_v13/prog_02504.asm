; DESCRIPTION: Places a green line segment connecting (181, 0) to (13, 216).
; PLAN: r0=181(x1), r1=0(y1), r2=13(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 0
LDI r2, 13
LDI r3, 216
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
