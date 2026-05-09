; DESCRIPTION: Creates a black circular shape at (255, 96) with radius 37.
; PLAN: r0=255(x), r1=96(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 96
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
