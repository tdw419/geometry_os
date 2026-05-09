; DESCRIPTION: Draws a yellow circle centered at (290, 134) with radius 53.
; PLAN: r0=290(x), r1=134(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 134
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
