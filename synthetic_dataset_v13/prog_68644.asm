; DESCRIPTION: Creates a blue circular shape at (373, 170) with radius 42.
; PLAN: r0=373(x), r1=170(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 170
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
