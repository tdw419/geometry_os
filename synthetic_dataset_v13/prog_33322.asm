; DESCRIPTION: Creates a yellow circular shape at (391, 176) with radius 19.
; PLAN: r0=391(x), r1=176(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 176
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
