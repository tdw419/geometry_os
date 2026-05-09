; DESCRIPTION: Creates a yellow circular shape at (342, 66) with radius 53.
; PLAN: r0=342(x), r1=66(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 342
LDI r1, 66
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
