; DESCRIPTION: Draws a yellow circle centered at (412, 174) with radius 46.
; PLAN: r0=412(x), r1=174(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 412
LDI r1, 174
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
