; DESCRIPTION: Draws a green circle centered at (371, 166) with radius 46.
; PLAN: r0=371(x), r1=166(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 166
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
