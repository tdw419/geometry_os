; DESCRIPTION: Creates a green circular shape at (322, 172) with radius 37.
; PLAN: r0=322(x), r1=172(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 172
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
