; DESCRIPTION: Places a blue line segment connecting (368, 118) to (223, 56).
; PLAN: r0=368(x1), r1=118(y1), r2=223(x2), r3=56(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 118
LDI r2, 223
LDI r3, 56
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
