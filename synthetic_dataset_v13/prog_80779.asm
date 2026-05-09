; DESCRIPTION: Draws a black circle centered at (309, 127) with radius 75.
; PLAN: r0=309(x), r1=127(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 127
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
