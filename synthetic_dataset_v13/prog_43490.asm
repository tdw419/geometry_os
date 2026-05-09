; DESCRIPTION: Creates a yellow circular shape at (213, 92) with radius 44.
; PLAN: r0=213(x), r1=92(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 92
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
