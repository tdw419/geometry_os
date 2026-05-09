; DESCRIPTION: Creates a cyan circular shape at (341, 54) with radius 29.
; PLAN: r0=341(x), r1=54(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 54
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
