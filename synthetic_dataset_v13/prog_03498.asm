; DESCRIPTION: Draws a green circle centered at (337, 83) with radius 48.
; PLAN: r0=337(x), r1=83(y), r2=48(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 337
LDI r1, 83
LDI r2, 48
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
