; DESCRIPTION: Draws a cyan circle centered at (192, 204) with radius 49.
; PLAN: r0=192(x), r1=204(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 204
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
