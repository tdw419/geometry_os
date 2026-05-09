; DESCRIPTION: Creates a green circular shape at (322, 61) with radius 49.
; PLAN: r0=322(x), r1=61(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 61
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
