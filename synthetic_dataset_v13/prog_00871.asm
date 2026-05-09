; DESCRIPTION: Creates a blue circular shape at (224, 215) with radius 32.
; PLAN: r0=224(x), r1=215(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 215
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
