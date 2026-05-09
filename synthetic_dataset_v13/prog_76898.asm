; DESCRIPTION: Draws a green circle centered at (216, 197) with radius 49.
; PLAN: r0=216(x), r1=197(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 197
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
