; DESCRIPTION: Creates a yellow circular shape at (286, 166) with radius 76.
; PLAN: r0=286(x), r1=166(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 166
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
