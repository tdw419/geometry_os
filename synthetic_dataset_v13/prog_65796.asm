; DESCRIPTION: Draws a black circle centered at (226, 220) with radius 26.
; PLAN: r0=226(x), r1=220(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 220
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
