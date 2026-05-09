; DESCRIPTION: Draws a white circle centered at (369, 63) with radius 53.
; PLAN: r0=369(x), r1=63(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 63
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
