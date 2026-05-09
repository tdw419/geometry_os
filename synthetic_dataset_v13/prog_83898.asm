; DESCRIPTION: Places a yellow line segment connecting (145, 207) to (373, 203).
; PLAN: r0=145(x1), r1=207(y1), r2=373(x2), r3=203(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 207
LDI r2, 373
LDI r3, 203
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
