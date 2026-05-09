; DESCRIPTION: Draws a black circle centered at (377, 231) with radius 17.
; PLAN: r0=377(x), r1=231(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 377
LDI r1, 231
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
