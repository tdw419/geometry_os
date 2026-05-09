; DESCRIPTION: Places a yellow line segment connecting (435, 246) to (373, 229).
; PLAN: r0=435(x1), r1=246(y1), r2=373(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 246
LDI r2, 373
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
