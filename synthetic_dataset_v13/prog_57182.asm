; DESCRIPTION: Draws a green circle centered at (286, 134) with radius 32.
; PLAN: r0=286(x), r1=134(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 134
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
