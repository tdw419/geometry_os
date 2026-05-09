; DESCRIPTION: Draws a white circle centered at (215, 102) with radius 55.
; PLAN: r0=215(x), r1=102(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 102
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
