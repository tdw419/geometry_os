; DESCRIPTION: Creates a cyan circular shape at (310, 105) with radius 47.
; PLAN: r0=310(x), r1=105(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 310
LDI r1, 105
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
