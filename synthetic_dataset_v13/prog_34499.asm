; DESCRIPTION: Creates a cyan circular shape at (194, 111) with radius 69.
; PLAN: r0=194(x), r1=111(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 111
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
