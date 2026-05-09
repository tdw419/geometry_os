; DESCRIPTION: Creates a cyan circular shape at (77, 54) with radius 29.
; PLAN: r0=77(x), r1=54(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 54
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
