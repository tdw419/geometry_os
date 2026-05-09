; DESCRIPTION: Places a green line segment connecting (99, 238) to (142, 74).
; PLAN: r0=99(x1), r1=238(y1), r2=142(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 238
LDI r2, 142
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
