; DESCRIPTION: Places a yellow line segment connecting (213, 203) to (11, 2).
; PLAN: r0=213(x1), r1=203(y1), r2=11(x2), r3=2(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 203
LDI r2, 11
LDI r3, 2
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
