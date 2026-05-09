; DESCRIPTION: Places a green line segment connecting (105, 183) to (136, 193).
; PLAN: r0=105(x1), r1=183(y1), r2=136(x2), r3=193(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 183
LDI r2, 136
LDI r3, 193
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
