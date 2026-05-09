; DESCRIPTION: Draws a white circle centered at (239, 65) with radius 47.
; PLAN: r0=239(x), r1=65(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 65
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
