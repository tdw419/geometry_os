; DESCRIPTION: Draws a green circle centered at (460, 98) with radius 13.
; PLAN: r0=460(x), r1=98(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 460
LDI r1, 98
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
