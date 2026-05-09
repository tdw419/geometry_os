; DESCRIPTION: Draws a yellow circle centered at (176, 172) with radius 65.
; PLAN: r0=176(x), r1=172(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 172
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
