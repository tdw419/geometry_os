; DESCRIPTION: Places a yellow line segment connecting (373, 114) to (17, 150).
; PLAN: r0=373(x1), r1=114(y1), r2=17(x2), r3=150(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 114
LDI r2, 17
LDI r3, 150
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
