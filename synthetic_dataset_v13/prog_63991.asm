; DESCRIPTION: Places a white line segment connecting (38, 17) to (224, 255).
; PLAN: r0=38(x1), r1=17(y1), r2=224(x2), r3=255(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 17
LDI r2, 224
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
