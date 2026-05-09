; DESCRIPTION: Draws a green circle centered at (197, 142) with radius 53.
; PLAN: r0=197(x), r1=142(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 142
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
