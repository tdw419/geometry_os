; DESCRIPTION: Creates a cyan circular shape at (349, 210) with radius 32.
; PLAN: r0=349(x), r1=210(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 210
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
