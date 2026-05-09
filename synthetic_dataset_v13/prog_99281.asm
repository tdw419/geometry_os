; DESCRIPTION: Creates a cyan circular shape at (378, 232) with radius 22.
; PLAN: r0=378(x), r1=232(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 232
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
