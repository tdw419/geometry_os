; DESCRIPTION: Creates a blue circular shape at (405, 188) with radius 48.
; PLAN: r0=405(x), r1=188(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 188
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
