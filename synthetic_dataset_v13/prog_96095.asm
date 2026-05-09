; DESCRIPTION: Places a yellow line segment connecting (489, 69) to (51, 116).
; PLAN: r0=489(x1), r1=69(y1), r2=51(x2), r3=116(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 69
LDI r2, 51
LDI r3, 116
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
