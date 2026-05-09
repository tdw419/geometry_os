; DESCRIPTION: Places a yellow line segment connecting (143, 203) to (88, 92).
; PLAN: r0=143(x1), r1=203(y1), r2=88(x2), r3=92(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 203
LDI r2, 88
LDI r3, 92
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
