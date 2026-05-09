; DESCRIPTION: Creates a blue circular shape at (462, 222) with radius 32.
; PLAN: r0=462(x), r1=222(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 462
LDI r1, 222
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
