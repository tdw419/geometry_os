; DESCRIPTION: Places a yellow line segment connecting (224, 28) to (128, 18).
; PLAN: r0=224(x1), r1=28(y1), r2=128(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 28
LDI r2, 128
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
