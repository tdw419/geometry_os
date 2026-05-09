; DESCRIPTION: Places a green line segment connecting (129, 139) to (134, 234).
; PLAN: r0=129(x1), r1=139(y1), r2=134(x2), r3=234(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 139
LDI r2, 134
LDI r3, 234
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
