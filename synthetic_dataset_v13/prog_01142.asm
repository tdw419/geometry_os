; DESCRIPTION: Draws a green circle centered at (241, 87) with radius 62.
; PLAN: r0=241(x), r1=87(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 87
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
