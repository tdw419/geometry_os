; DESCRIPTION: Creates a cyan circular shape at (420, 62) with radius 40.
; PLAN: r0=420(x), r1=62(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 62
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
