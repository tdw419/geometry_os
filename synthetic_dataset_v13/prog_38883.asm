; DESCRIPTION: Creates a cyan circular shape at (256, 69) with radius 61.
; PLAN: r0=256(x), r1=69(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 69
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
