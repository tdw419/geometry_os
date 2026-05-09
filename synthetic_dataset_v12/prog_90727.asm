; DESCRIPTION: Creates a cyan circular shape at (326, 117) with radius 73.
; PLAN: r0=326(x), r1=117(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 326
LDI r1, 117
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
