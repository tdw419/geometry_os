; DESCRIPTION: Draws a yellow circle centered at (276, 151) with radius 80.
; PLAN: r0=276(x), r1=151(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 151
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
