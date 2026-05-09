; DESCRIPTION: Places a white circle of radius 17 at center (224, 123).
; PLAN: r0=224(x), r1=123(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 123
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
