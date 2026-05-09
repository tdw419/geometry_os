; DESCRIPTION: Creates a blue circular shape at (129, 168) with radius 48.
; PLAN: r0=129(x), r1=168(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 168
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
