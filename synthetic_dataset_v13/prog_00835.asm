; DESCRIPTION: Draws a white circle centered at (393, 204) with radius 29.
; PLAN: r0=393(x), r1=204(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 204
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
