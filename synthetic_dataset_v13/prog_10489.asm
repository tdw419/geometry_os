; DESCRIPTION: Creates a orange circular shape at (155, 124) with radius 48.
; PLAN: r0=155(x), r1=124(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 124
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
