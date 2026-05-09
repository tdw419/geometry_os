; DESCRIPTION: Places a white line segment connecting (462, 135) to (80, 224).
; PLAN: r0=462(x1), r1=135(y1), r2=80(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 135
LDI r2, 80
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
