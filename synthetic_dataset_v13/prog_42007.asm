; DESCRIPTION: Places a yellow line segment connecting (509, 185) to (358, 17).
; PLAN: r0=509(x1), r1=185(y1), r2=358(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 185
LDI r2, 358
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
