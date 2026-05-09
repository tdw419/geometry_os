; DESCRIPTION: Creates a cyan circular shape at (384, 48) with radius 35.
; PLAN: r0=384(x), r1=48(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 48
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
