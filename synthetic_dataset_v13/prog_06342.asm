; DESCRIPTION: Creates a blue circular shape at (386, 199) with radius 24.
; PLAN: r0=386(x), r1=199(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 199
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
