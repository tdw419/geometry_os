; DESCRIPTION: Creates a yellow circular shape at (375, 127) with radius 62.
; PLAN: r0=375(x), r1=127(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 127
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
