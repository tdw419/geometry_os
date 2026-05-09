; DESCRIPTION: Creates a yellow circular shape at (303, 19) with radius 16.
; PLAN: r0=303(x), r1=19(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 19
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
