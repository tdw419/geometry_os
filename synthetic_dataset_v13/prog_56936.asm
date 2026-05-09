; DESCRIPTION: Creates a yellow circular shape at (317, 204) with radius 47.
; PLAN: r0=317(x), r1=204(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 204
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
