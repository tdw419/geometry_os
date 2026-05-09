; DESCRIPTION: Creates a black circular shape at (426, 133) with radius 58.
; PLAN: r0=426(x), r1=133(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 426
LDI r1, 133
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
