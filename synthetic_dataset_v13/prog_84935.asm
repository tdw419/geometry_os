; DESCRIPTION: Draws a white circle centered at (124, 71) with radius 71.
; PLAN: r0=124(x), r1=71(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 71
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
