; DESCRIPTION: Draws a black circle centered at (268, 124) with radius 60.
; PLAN: r0=268(x), r1=124(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 124
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
