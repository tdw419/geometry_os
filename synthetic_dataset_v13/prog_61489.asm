; DESCRIPTION: Places a black circle of radius 61 at center (224, 154).
; PLAN: r0=224(x), r1=154(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 154
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
