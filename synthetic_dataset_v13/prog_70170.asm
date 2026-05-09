; DESCRIPTION: Draws a green circle centered at (380, 122) with radius 31.
; PLAN: r0=380(x), r1=122(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 122
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
