; DESCRIPTION: Draws a white circle centered at (127, 69) with radius 36.
; PLAN: r0=127(x), r1=69(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 69
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
