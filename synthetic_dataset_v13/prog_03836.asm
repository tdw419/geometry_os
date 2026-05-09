; DESCRIPTION: Draws a yellow circle centered at (285, 28) with radius 24.
; PLAN: r0=285(x), r1=28(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 28
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
