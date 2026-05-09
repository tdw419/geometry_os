; DESCRIPTION: Draws a white circle centered at (111, 67) with radius 47.
; PLAN: r0=111(x), r1=67(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 67
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
