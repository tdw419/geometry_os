; DESCRIPTION: Places a white line segment connecting (464, 224) to (378, 194).
; PLAN: r0=464(x1), r1=224(y1), r2=378(x2), r3=194(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 224
LDI r2, 378
LDI r3, 194
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
