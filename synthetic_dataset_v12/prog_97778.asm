; DESCRIPTION: Draws a yellow circle centered at (64, 81) with radius 50.
; PLAN: r0=64(x), r1=81(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 81
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
