; DESCRIPTION: Creates a cyan circular shape at (349, 42) with radius 33.
; PLAN: r0=349(x), r1=42(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 42
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
