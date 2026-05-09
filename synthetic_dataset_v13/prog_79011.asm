; DESCRIPTION: Draws a yellow circle centered at (64, 163) with radius 35.
; PLAN: r0=64(x), r1=163(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 163
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
