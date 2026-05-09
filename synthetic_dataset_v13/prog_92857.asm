; DESCRIPTION: Places a green line segment connecting (430, 158) to (472, 223).
; PLAN: r0=430(x1), r1=158(y1), r2=472(x2), r3=223(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 158
LDI r2, 472
LDI r3, 223
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
