; DESCRIPTION: Places a yellow line segment connecting (14, 222) to (250, 189).
; PLAN: r0=14(x1), r1=222(y1), r2=250(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 222
LDI r2, 250
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
