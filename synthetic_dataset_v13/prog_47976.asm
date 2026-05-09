; DESCRIPTION: Draws a white circle centered at (217, 180) with radius 59.
; PLAN: r0=217(x), r1=180(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 180
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
