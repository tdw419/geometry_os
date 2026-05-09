; DESCRIPTION: Creates a green circular shape at (359, 92) with radius 18.
; PLAN: r0=359(x), r1=92(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 92
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
