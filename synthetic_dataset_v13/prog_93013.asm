; DESCRIPTION: Creates a yellow circular shape at (431, 141) with radius 53.
; PLAN: r0=431(x), r1=141(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 141
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
