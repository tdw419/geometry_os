; DESCRIPTION: Draws a black circle centered at (113, 120) with radius 65.
; PLAN: r0=113(x), r1=120(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 120
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
