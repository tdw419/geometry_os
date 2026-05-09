; DESCRIPTION: Draws a white circle centered at (373, 108) with radius 60.
; PLAN: r0=373(x), r1=108(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 108
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
