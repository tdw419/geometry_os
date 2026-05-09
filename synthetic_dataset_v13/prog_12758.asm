; DESCRIPTION: Places a black line segment connecting (129, 224) to (13, 171).
; PLAN: r0=129(x1), r1=224(y1), r2=13(x2), r3=171(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 224
LDI r2, 13
LDI r3, 171
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
