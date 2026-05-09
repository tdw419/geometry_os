; DESCRIPTION: Places a yellow line segment connecting (246, 237) to (241, 56).
; PLAN: r0=246(x1), r1=237(y1), r2=241(x2), r3=56(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 237
LDI r2, 241
LDI r3, 56
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
