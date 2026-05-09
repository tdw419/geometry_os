; DESCRIPTION: Creates a cyan circular shape at (57, 184) with radius 31.
; PLAN: r0=57(x), r1=184(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 184
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
