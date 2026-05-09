; DESCRIPTION: Places a yellow line segment connecting (134, 136) to (179, 132).
; PLAN: r0=134(x1), r1=136(y1), r2=179(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 136
LDI r2, 179
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
