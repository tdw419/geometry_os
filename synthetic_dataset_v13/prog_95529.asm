; DESCRIPTION: Creates a cyan circular shape at (299, 123) with radius 48.
; PLAN: r0=299(x), r1=123(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 299
LDI r1, 123
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
