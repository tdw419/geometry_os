; DESCRIPTION: Creates a cyan circular shape at (155, 88) with radius 63.
; PLAN: r0=155(x), r1=88(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 88
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
