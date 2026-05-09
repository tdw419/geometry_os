; DESCRIPTION: Draws a white circle centered at (254, 197) with radius 39.
; PLAN: r0=254(x), r1=197(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 197
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
