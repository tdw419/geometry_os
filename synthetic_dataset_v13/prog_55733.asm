; DESCRIPTION: Draws a black circle centered at (168, 110) with radius 48.
; PLAN: r0=168(x), r1=110(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 110
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
