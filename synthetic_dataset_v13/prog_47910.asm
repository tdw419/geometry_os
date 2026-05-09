; DESCRIPTION: Creates a cyan circular shape at (205, 147) with radius 33.
; PLAN: r0=205(x), r1=147(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 147
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
