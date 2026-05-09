; DESCRIPTION: Places a yellow line segment connecting (13, 109) to (203, 149).
; PLAN: r0=13(x1), r1=109(y1), r2=203(x2), r3=149(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 109
LDI r2, 203
LDI r3, 149
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
