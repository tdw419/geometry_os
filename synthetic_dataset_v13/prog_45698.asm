; DESCRIPTION: Creates a yellow circular shape at (104, 72) with radius 64.
; PLAN: r0=104(x), r1=72(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 72
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
