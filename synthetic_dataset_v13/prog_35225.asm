; DESCRIPTION: Places a red circle of radius 31 at center (224, 189).
; PLAN: r0=224(x), r1=189(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 189
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
