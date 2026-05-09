; DESCRIPTION: Draws a yellow circle centered at (238, 127) with radius 53.
; PLAN: r0=238(x), r1=127(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 127
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
