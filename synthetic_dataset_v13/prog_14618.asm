; DESCRIPTION: Places a green line segment connecting (172, 114) to (86, 105).
; PLAN: r0=172(x1), r1=114(y1), r2=86(x2), r3=105(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 114
LDI r2, 86
LDI r3, 105
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
