; DESCRIPTION: Places a yellow line segment connecting (361, 165) to (427, 144).
; PLAN: r0=361(x1), r1=165(y1), r2=427(x2), r3=144(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 165
LDI r2, 427
LDI r3, 144
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
