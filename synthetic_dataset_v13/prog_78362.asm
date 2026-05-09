; DESCRIPTION: Draws a green circle centered at (455, 115) with radius 52.
; PLAN: r0=455(x), r1=115(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 455
LDI r1, 115
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
