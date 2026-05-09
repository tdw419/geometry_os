; DESCRIPTION: Places a green line segment connecting (457, 109) to (105, 149).
; PLAN: r0=457(x1), r1=109(y1), r2=105(x2), r3=149(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 109
LDI r2, 105
LDI r3, 149
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
