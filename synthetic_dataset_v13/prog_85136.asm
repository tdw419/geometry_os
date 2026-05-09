; DESCRIPTION: Creates a cyan circular shape at (136, 46) with radius 34.
; PLAN: r0=136(x), r1=46(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 46
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
