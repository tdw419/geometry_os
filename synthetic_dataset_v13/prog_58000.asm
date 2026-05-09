; DESCRIPTION: Creates a yellow circular shape at (278, 133) with radius 74.
; PLAN: r0=278(x), r1=133(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 133
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
