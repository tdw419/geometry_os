; DESCRIPTION: Creates a green circular shape at (378, 209) with radius 14.
; PLAN: r0=378(x), r1=209(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 209
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
