; DESCRIPTION: Draws a white circle centered at (108, 92) with radius 67.
; PLAN: r0=108(x), r1=92(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 92
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
