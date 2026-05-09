; DESCRIPTION: Creates a yellow circular shape at (403, 142) with radius 31.
; PLAN: r0=403(x), r1=142(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 142
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
