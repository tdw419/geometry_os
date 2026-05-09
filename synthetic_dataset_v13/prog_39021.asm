; DESCRIPTION: Places a yellow line segment connecting (181, 174) to (285, 40).
; PLAN: r0=181(x1), r1=174(y1), r2=285(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 174
LDI r2, 285
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
