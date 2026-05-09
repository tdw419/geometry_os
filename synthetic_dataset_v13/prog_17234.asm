; DESCRIPTION: Places a yellow line segment connecting (373, 224) to (26, 141).
; PLAN: r0=373(x1), r1=224(y1), r2=26(x2), r3=141(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 224
LDI r2, 26
LDI r3, 141
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
