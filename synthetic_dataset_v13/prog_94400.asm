; DESCRIPTION: Draws a yellow circle centered at (241, 151) with radius 14.
; PLAN: r0=241(x), r1=151(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 151
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
