; DESCRIPTION: Creates a cyan circular shape at (155, 130) with radius 34.
; PLAN: r0=155(x), r1=130(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 130
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
