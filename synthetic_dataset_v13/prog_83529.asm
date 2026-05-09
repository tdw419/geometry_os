; DESCRIPTION: Creates a green circular shape at (213, 55) with radius 37.
; PLAN: r0=213(x), r1=55(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 55
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
