; DESCRIPTION: Places a green line segment connecting (333, 122) to (58, 211).
; PLAN: r0=333(x1), r1=122(y1), r2=58(x2), r3=211(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 122
LDI r2, 58
LDI r3, 211
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
