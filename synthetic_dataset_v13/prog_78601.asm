; DESCRIPTION: Draws a yellow circle centered at (184, 35) with radius 16.
; PLAN: r0=184(x), r1=35(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 35
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
