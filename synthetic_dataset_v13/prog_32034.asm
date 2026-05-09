; DESCRIPTION: Draws a yellow circle centered at (165, 154) with radius 60.
; PLAN: r0=165(x), r1=154(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 154
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
