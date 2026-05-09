; DESCRIPTION: Draws a white circle centered at (240, 236) with radius 14.
; PLAN: r0=240(x), r1=236(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 236
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
