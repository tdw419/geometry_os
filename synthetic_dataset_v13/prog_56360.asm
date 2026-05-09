; DESCRIPTION: Draws a white circle centered at (480, 81) with radius 31.
; PLAN: r0=480(x), r1=81(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 480
LDI r1, 81
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
