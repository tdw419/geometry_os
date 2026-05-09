; DESCRIPTION: Draws a yellow circle centered at (368, 207) with radius 19.
; PLAN: r0=368(x), r1=207(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 207
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
