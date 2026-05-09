; DESCRIPTION: Creates a cyan circular shape at (163, 121) with radius 57.
; PLAN: r0=163(x), r1=121(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 121
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
