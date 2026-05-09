; DESCRIPTION: Places a white line segment connecting (224, 2) to (218, 53).
; PLAN: r0=224(x1), r1=2(y1), r2=218(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 2
LDI r2, 218
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
