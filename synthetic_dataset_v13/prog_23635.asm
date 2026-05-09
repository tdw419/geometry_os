; DESCRIPTION: Places a yellow line segment connecting (413, 19) to (13, 188).
; PLAN: r0=413(x1), r1=19(y1), r2=13(x2), r3=188(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 19
LDI r2, 13
LDI r3, 188
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
