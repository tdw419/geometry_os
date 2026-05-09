; DESCRIPTION: Places a yellow line segment connecting (506, 17) to (167, 28).
; PLAN: r0=506(x1), r1=17(y1), r2=167(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 17
LDI r2, 167
LDI r3, 28
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
