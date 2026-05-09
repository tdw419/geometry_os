; DESCRIPTION: Draws a cyan circle centered at (436, 43) with radius 14.
; PLAN: r0=436(x), r1=43(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 436
LDI r1, 43
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
