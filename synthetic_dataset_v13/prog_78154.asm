; DESCRIPTION: Draws a black circle centered at (190, 187) with radius 61.
; PLAN: r0=190(x), r1=187(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 187
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
