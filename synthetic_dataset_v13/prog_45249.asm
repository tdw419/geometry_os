; DESCRIPTION: Places a red line segment connecting (227, 181) to (7, 156).
; PLAN: r0=227(x1), r1=181(y1), r2=7(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 181
LDI r2, 7
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
