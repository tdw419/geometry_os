; DESCRIPTION: Creates a cyan circular shape at (251, 86) with radius 61.
; PLAN: r0=251(x), r1=86(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 86
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
