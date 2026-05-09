; DESCRIPTION: Places a yellow line segment connecting (265, 222) to (427, 56).
; PLAN: r0=265(x1), r1=222(y1), r2=427(x2), r3=56(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 222
LDI r2, 427
LDI r3, 56
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
