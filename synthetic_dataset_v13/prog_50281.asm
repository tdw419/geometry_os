; DESCRIPTION: Draws a white circle centered at (417, 164) with radius 59.
; PLAN: r0=417(x), r1=164(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 164
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
