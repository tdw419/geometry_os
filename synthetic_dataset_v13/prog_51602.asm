; DESCRIPTION: Draws a yellow circle centered at (415, 117) with radius 62.
; PLAN: r0=415(x), r1=117(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 117
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
