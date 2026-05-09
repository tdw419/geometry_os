; DESCRIPTION: Draws a black circle centered at (320, 72) with radius 70.
; PLAN: r0=320(x), r1=72(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 72
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
