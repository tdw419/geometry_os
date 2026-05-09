; DESCRIPTION: Places a green line segment connecting (24, 70) to (3, 136).
; PLAN: r0=24(x1), r1=70(y1), r2=3(x2), r3=136(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 70
LDI r2, 3
LDI r3, 136
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
