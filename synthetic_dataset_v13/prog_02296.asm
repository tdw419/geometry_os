; DESCRIPTION: Creates a yellow circular shape at (134, 194) with radius 28.
; PLAN: r0=134(x), r1=194(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 194
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
