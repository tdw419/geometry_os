; DESCRIPTION: Places a green line segment connecting (413, 17) to (101, 156).
; PLAN: r0=413(x1), r1=17(y1), r2=101(x2), r3=156(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 17
LDI r2, 101
LDI r3, 156
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
