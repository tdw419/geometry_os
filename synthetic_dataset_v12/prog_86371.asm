; DESCRIPTION: Creates a yellow circular shape at (75, 171) with radius 39.
; PLAN: r0=75(x), r1=171(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 171
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
