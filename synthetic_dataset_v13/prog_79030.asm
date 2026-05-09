; DESCRIPTION: Creates a yellow circular shape at (354, 148) with radius 59.
; PLAN: r0=354(x), r1=148(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 148
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
