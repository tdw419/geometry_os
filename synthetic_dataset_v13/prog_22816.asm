; DESCRIPTION: Places a black line segment connecting (407, 14) to (189, 222).
; PLAN: r0=407(x1), r1=14(y1), r2=189(x2), r3=222(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 14
LDI r2, 189
LDI r3, 222
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
