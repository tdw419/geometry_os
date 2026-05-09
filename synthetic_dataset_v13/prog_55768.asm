; DESCRIPTION: Creates a cyan circular shape at (254, 85) with radius 39.
; PLAN: r0=254(x), r1=85(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 85
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
