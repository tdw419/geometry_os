; DESCRIPTION: Places a yellow line segment connecting (53, 113) to (224, 222).
; PLAN: r0=53(x1), r1=113(y1), r2=224(x2), r3=222(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 113
LDI r2, 224
LDI r3, 222
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
