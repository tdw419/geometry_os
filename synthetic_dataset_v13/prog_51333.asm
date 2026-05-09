; DESCRIPTION: Places a yellow line segment connecting (161, 158) to (293, 194).
; PLAN: r0=161(x1), r1=158(y1), r2=293(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 158
LDI r2, 293
LDI r3, 194
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
