; DESCRIPTION: Places a yellow line segment connecting (421, 48) to (469, 252).
; PLAN: r0=421(x1), r1=48(y1), r2=469(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 48
LDI r2, 469
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
