; DESCRIPTION: Places a yellow line segment connecting (116, 4) to (490, 17).
; PLAN: r0=116(x1), r1=4(y1), r2=490(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 4
LDI r2, 490
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
