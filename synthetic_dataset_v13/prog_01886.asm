; DESCRIPTION: Places a yellow line segment connecting (448, 175) to (72, 114).
; PLAN: r0=448(x1), r1=175(y1), r2=72(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 175
LDI r2, 72
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
