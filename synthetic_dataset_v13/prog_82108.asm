; DESCRIPTION: Draws a white circle centered at (346, 82) with radius 13.
; PLAN: r0=346(x), r1=82(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 82
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
