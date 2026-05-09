; DESCRIPTION: Creates a yellow circular shape at (372, 152) with radius 61.
; PLAN: r0=372(x), r1=152(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 152
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
