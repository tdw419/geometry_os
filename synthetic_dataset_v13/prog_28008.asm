; DESCRIPTION: Places a green line segment connecting (134, 88) to (143, 188).
; PLAN: r0=134(x1), r1=88(y1), r2=143(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 88
LDI r2, 143
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
