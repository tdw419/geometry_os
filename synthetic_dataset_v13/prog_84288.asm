; DESCRIPTION: Places a yellow line segment connecting (167, 1) to (17, 251).
; PLAN: r0=167(x1), r1=1(y1), r2=17(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 1
LDI r2, 17
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
