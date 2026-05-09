; DESCRIPTION: Places a green line segment connecting (258, 110) to (327, 77).
; PLAN: r0=258(x1), r1=110(y1), r2=327(x2), r3=77(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 110
LDI r2, 327
LDI r3, 77
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
