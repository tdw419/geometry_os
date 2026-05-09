; DESCRIPTION: Draws a green circle centered at (276, 83) with radius 55.
; PLAN: r0=276(x), r1=83(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 83
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
