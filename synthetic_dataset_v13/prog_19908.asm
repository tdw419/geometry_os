; DESCRIPTION: Draws a cyan circle centered at (478, 62) with radius 33.
; PLAN: r0=478(x), r1=62(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 478
LDI r1, 62
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
