; DESCRIPTION: Draws a green circle centered at (256, 44) with radius 31.
; PLAN: r0=256(x), r1=44(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 44
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
