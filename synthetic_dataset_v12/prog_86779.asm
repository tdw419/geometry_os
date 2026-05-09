; DESCRIPTION: Places a white circle of radius 76 at center (224, 127).
; PLAN: r0=224(x), r1=127(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 127
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
