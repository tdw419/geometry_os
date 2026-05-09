; DESCRIPTION: Creates a cyan circular shape at (238, 119) with radius 57.
; PLAN: r0=238(x), r1=119(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 119
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
