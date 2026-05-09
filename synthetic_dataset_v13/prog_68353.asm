; DESCRIPTION: Creates a cyan circular shape at (61, 68) with radius 34.
; PLAN: r0=61(x), r1=68(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 68
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
