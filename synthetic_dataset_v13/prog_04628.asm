; DESCRIPTION: Places a yellow line segment connecting (494, 203) to (389, 36).
; PLAN: r0=494(x1), r1=203(y1), r2=389(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 203
LDI r2, 389
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
