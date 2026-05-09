; DESCRIPTION: Draws a black circle centered at (305, 198) with radius 13.
; PLAN: r0=305(x), r1=198(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 305
LDI r1, 198
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
