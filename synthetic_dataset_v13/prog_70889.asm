; DESCRIPTION: Creates a black circular shape at (225, 180) with radius 64.
; PLAN: r0=225(x), r1=180(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 180
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
