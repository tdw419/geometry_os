; DESCRIPTION: Creates a blue circular shape at (214, 66) with radius 63.
; PLAN: r0=214(x), r1=66(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 66
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
