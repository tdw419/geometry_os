; DESCRIPTION: Draws a white circle centered at (409, 81) with radius 67.
; PLAN: r0=409(x), r1=81(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 81
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
