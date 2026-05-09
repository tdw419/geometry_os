; DESCRIPTION: Places a yellow line segment connecting (43, 137) to (373, 120).
; PLAN: r0=43(x1), r1=137(y1), r2=373(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 137
LDI r2, 373
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
