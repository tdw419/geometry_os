; DESCRIPTION: Creates a cyan circular shape at (383, 175) with radius 64.
; PLAN: r0=383(x), r1=175(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 383
LDI r1, 175
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
