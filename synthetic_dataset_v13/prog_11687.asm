; DESCRIPTION: Creates a cyan circular shape at (426, 49) with radius 17.
; PLAN: r0=426(x), r1=49(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 426
LDI r1, 49
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
