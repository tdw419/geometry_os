; DESCRIPTION: Draws a green circle centered at (211, 194) with radius 29.
; PLAN: r0=211(x), r1=194(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 194
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
