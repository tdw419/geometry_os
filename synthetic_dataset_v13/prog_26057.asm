; DESCRIPTION: Creates a yellow circular shape at (373, 133) with radius 62.
; PLAN: r0=373(x), r1=133(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 133
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
