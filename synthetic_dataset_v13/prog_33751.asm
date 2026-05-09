; DESCRIPTION: Places a yellow line segment connecting (239, 14) to (454, 54).
; PLAN: r0=239(x1), r1=14(y1), r2=454(x2), r3=54(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 14
LDI r2, 454
LDI r3, 54
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
