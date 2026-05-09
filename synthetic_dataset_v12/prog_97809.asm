; DESCRIPTION: Places a yellow line segment connecting (88, 97) to (29, 143).
; PLAN: r0=88(x1), r1=97(y1), r2=29(x2), r3=143(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 97
LDI r2, 29
LDI r3, 143
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
