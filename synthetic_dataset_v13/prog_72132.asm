; DESCRIPTION: Places a white line segment connecting (244, 203) to (467, 64).
; PLAN: r0=244(x1), r1=203(y1), r2=467(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 203
LDI r2, 467
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
