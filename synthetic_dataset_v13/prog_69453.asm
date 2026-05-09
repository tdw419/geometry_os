; DESCRIPTION: Places a yellow line segment connecting (135, 224) to (365, 255).
; PLAN: r0=135(x1), r1=224(y1), r2=365(x2), r3=255(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 224
LDI r2, 365
LDI r3, 255
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
