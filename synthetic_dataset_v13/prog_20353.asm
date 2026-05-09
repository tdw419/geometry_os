; DESCRIPTION: Places a yellow line segment connecting (111, 161) to (224, 189).
; PLAN: r0=111(x1), r1=161(y1), r2=224(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 161
LDI r2, 224
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
