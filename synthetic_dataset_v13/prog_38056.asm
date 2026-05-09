; DESCRIPTION: Creates a yellow circular shape at (424, 116) with radius 19.
; PLAN: r0=424(x), r1=116(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 116
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
