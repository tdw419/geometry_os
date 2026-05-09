; DESCRIPTION: Creates a black circular shape at (386, 209) with radius 12.
; PLAN: r0=386(x), r1=209(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 209
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
