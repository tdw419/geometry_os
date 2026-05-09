; DESCRIPTION: Draws a yellow circle centered at (225, 58) with radius 11.
; PLAN: r0=225(x), r1=58(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 58
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
