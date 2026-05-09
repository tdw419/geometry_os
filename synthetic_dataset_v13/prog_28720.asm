; DESCRIPTION: Creates a cyan circular shape at (69, 43) with radius 37.
; PLAN: r0=69(x), r1=43(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 43
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
