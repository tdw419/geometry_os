; DESCRIPTION: Places a yellow line segment connecting (178, 17) to (15, 169).
; PLAN: r0=178(x1), r1=17(y1), r2=15(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 17
LDI r2, 15
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
