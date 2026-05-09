; DESCRIPTION: Creates a black circular shape at (160, 108) with radius 80.
; PLAN: r0=160(x), r1=108(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 108
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
