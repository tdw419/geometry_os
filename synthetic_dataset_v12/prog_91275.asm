; DESCRIPTION: Creates a yellow circular shape at (114, 121) with radius 46.
; PLAN: r0=114(x), r1=121(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 121
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
