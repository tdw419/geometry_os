; DESCRIPTION: Places a blue circle of radius 21 at center (95, 224).
; PLAN: r0=95(x), r1=224(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 224
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
