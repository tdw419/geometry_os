; DESCRIPTION: Creates a blue circular shape at (405, 80) with radius 32.
; PLAN: r0=405(x), r1=80(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 80
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
