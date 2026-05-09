; DESCRIPTION: Places a white line segment connecting (276, 224) to (333, 179).
; PLAN: r0=276(x1), r1=224(y1), r2=333(x2), r3=179(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 224
LDI r2, 333
LDI r3, 179
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
