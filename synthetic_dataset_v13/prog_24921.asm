; DESCRIPTION: Draws a black circle centered at (415, 206) with radius 49.
; PLAN: r0=415(x), r1=206(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 206
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
