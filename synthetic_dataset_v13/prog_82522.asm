; DESCRIPTION: Creates a cyan circular shape at (57, 86) with radius 39.
; PLAN: r0=57(x), r1=86(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 86
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
