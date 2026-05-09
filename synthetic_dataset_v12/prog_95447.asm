; DESCRIPTION: Draws a white circle centered at (320, 144) with radius 53.
; PLAN: r0=320(x), r1=144(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 144
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
