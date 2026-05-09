; DESCRIPTION: Draws a black circle centered at (385, 180) with radius 75.
; PLAN: r0=385(x), r1=180(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 180
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
