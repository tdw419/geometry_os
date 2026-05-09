; DESCRIPTION: Places a green line segment connecting (29, 127) to (224, 73).
; PLAN: r0=29(x1), r1=127(y1), r2=224(x2), r3=73(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 127
LDI r2, 224
LDI r3, 73
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
