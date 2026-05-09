; DESCRIPTION: Creates a black circular shape at (386, 45) with radius 25.
; PLAN: r0=386(x), r1=45(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 45
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
