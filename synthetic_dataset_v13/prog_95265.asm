; DESCRIPTION: Creates a cyan circular shape at (321, 130) with radius 80.
; PLAN: r0=321(x), r1=130(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 130
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
