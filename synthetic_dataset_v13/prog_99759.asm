; DESCRIPTION: Creates a cyan circular shape at (190, 175) with radius 74.
; PLAN: r0=190(x), r1=175(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 175
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
