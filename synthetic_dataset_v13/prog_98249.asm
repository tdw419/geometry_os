; DESCRIPTION: Draws a black circle centered at (440, 145) with radius 50.
; PLAN: r0=440(x), r1=145(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 440
LDI r1, 145
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
