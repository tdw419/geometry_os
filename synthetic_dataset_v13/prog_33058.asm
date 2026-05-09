; DESCRIPTION: Creates a yellow circular shape at (384, 207) with radius 44.
; PLAN: r0=384(x), r1=207(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 207
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
