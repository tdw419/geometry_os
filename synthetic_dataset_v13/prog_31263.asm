; DESCRIPTION: Places a green line segment connecting (181, 80) to (33, 100).
; PLAN: r0=181(x1), r1=80(y1), r2=33(x2), r3=100(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 80
LDI r2, 33
LDI r3, 100
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
