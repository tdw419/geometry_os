; DESCRIPTION: Places a yellow line segment connecting (315, 97) to (283, 17).
; PLAN: r0=315(x1), r1=97(y1), r2=283(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 97
LDI r2, 283
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
