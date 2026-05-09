; DESCRIPTION: Draws a white circle centered at (168, 181) with radius 74.
; PLAN: r0=168(x), r1=181(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 181
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
