; DESCRIPTION: Places a green line segment connecting (300, 136) to (12, 26).
; PLAN: r0=300(x1), r1=136(y1), r2=12(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 136
LDI r2, 12
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
