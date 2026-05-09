; DESCRIPTION: Places a blue line segment connecting (340, 167) to (271, 224).
; PLAN: r0=340(x1), r1=167(y1), r2=271(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 167
LDI r2, 271
LDI r3, 224
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
