; DESCRIPTION: Creates a blue circular shape at (405, 72) with radius 39.
; PLAN: r0=405(x), r1=72(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 72
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
