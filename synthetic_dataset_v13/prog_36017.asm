; DESCRIPTION: Places a white line segment connecting (195, 102) to (118, 224).
; PLAN: r0=195(x1), r1=102(y1), r2=118(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 102
LDI r2, 118
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
