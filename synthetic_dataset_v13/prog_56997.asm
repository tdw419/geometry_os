; DESCRIPTION: Creates a cyan circular shape at (397, 161) with radius 43.
; PLAN: r0=397(x), r1=161(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 161
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
