; DESCRIPTION: Creates a yellow circular shape at (261, 151) with radius 72.
; PLAN: r0=261(x), r1=151(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 151
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
