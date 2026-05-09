; DESCRIPTION: Creates a cyan circular shape at (283, 130) with radius 12.
; PLAN: r0=283(x), r1=130(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 130
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
