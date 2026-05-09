; DESCRIPTION: Creates a yellow circular shape at (134, 173) with radius 56.
; PLAN: r0=134(x), r1=173(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 173
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
