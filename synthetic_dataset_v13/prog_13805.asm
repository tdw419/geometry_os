; DESCRIPTION: Creates a magenta circular shape at (382, 192) with radius 59.
; PLAN: r0=382(x), r1=192(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 192
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
