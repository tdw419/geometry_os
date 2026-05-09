; DESCRIPTION: Creates a yellow circular shape at (396, 165) with radius 27.
; PLAN: r0=396(x), r1=165(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 165
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
