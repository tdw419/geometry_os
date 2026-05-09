; DESCRIPTION: Draws a white circle centered at (424, 140) with radius 68.
; PLAN: r0=424(x), r1=140(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 140
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
