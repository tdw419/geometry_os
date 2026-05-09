; DESCRIPTION: Places a yellow line segment connecting (56, 95) to (329, 189).
; PLAN: r0=56(x1), r1=95(y1), r2=329(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 95
LDI r2, 329
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
