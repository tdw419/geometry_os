; DESCRIPTION: Creates a cyan circular shape at (332, 93) with radius 15.
; PLAN: r0=332(x), r1=93(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 93
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
