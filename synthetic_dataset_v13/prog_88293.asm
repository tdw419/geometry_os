; DESCRIPTION: Creates a yellow circular shape at (153, 39) with radius 17.
; PLAN: r0=153(x), r1=39(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 39
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
