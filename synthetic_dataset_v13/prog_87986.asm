; DESCRIPTION: Places a green line segment connecting (258, 53) to (99, 25).
; PLAN: r0=258(x1), r1=53(y1), r2=99(x2), r3=25(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 53
LDI r2, 99
LDI r3, 25
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
