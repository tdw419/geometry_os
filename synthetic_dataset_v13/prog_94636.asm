; DESCRIPTION: Places a magenta circle of radius 32 at center (152, 224).
; PLAN: r0=152(x), r1=224(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 224
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
