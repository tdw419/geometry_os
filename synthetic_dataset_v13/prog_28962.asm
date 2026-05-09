; DESCRIPTION: Places a yellow line segment connecting (12, 194) to (259, 252).
; PLAN: r0=12(x1), r1=194(y1), r2=259(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 194
LDI r2, 259
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
