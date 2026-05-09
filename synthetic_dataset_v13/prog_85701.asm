; DESCRIPTION: Creates a cyan circular shape at (349, 183) with radius 47.
; PLAN: r0=349(x), r1=183(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 183
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
