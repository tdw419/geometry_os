; DESCRIPTION: Draws a yellow circle centered at (358, 65) with radius 32.
; PLAN: r0=358(x), r1=65(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 358
LDI r1, 65
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
