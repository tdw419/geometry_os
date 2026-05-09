; DESCRIPTION: Creates a black circular shape at (385, 143) with radius 80.
; PLAN: r0=385(x), r1=143(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 143
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
