; DESCRIPTION: Creates a blue circular shape at (168, 154) with radius 80.
; PLAN: r0=168(x), r1=154(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 154
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
