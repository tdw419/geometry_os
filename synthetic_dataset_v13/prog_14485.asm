; DESCRIPTION: Creates a cyan circular shape at (359, 49) with radius 48.
; PLAN: r0=359(x), r1=49(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 49
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
