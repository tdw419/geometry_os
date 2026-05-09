; DESCRIPTION: Creates a blue circular shape at (73, 86) with radius 59.
; PLAN: r0=73(x), r1=86(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 86
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
