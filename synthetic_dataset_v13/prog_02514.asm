; DESCRIPTION: Draws a black circle centered at (197, 118) with radius 46.
; PLAN: r0=197(x), r1=118(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 118
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
