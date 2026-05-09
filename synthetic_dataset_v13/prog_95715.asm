; DESCRIPTION: Draws a yellow circle centered at (340, 141) with radius 69.
; PLAN: r0=340(x), r1=141(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 141
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
