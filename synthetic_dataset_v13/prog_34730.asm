; DESCRIPTION: Places a white line segment connecting (424, 224) to (214, 11).
; PLAN: r0=424(x1), r1=224(y1), r2=214(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 224
LDI r2, 214
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
