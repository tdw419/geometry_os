; DESCRIPTION: Draws a green circle centered at (209, 199) with radius 38.
; PLAN: r0=209(x), r1=199(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 199
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
