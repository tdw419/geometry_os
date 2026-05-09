; DESCRIPTION: Creates a cyan circular shape at (129, 180) with radius 31.
; PLAN: r0=129(x), r1=180(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 180
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
