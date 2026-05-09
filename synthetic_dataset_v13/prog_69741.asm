; DESCRIPTION: Places a yellow line segment connecting (167, 181) to (278, 76).
; PLAN: r0=167(x1), r1=181(y1), r2=278(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 181
LDI r2, 278
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
