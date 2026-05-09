; DESCRIPTION: Places a orange line segment connecting (469, 112) to (237, 183).
; PLAN: r0=469(x1), r1=112(y1), r2=237(x2), r3=183(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 112
LDI r2, 237
LDI r3, 183
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
