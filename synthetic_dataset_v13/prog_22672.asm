; DESCRIPTION: Draws a green circle centered at (165, 220) with radius 12.
; PLAN: r0=165(x), r1=220(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 220
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
