; DESCRIPTION: Creates a yellow circular shape at (222, 120) with radius 19.
; PLAN: r0=222(x), r1=120(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 120
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
