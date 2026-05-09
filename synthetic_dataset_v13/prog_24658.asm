; DESCRIPTION: Draws a white circle centered at (204, 173) with radius 17.
; PLAN: r0=204(x), r1=173(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 173
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
