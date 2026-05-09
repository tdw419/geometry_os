; DESCRIPTION: Creates a cyan circular shape at (98, 233) with radius 11.
; PLAN: r0=98(x), r1=233(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 233
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
