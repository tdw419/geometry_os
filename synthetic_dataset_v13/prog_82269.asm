; DESCRIPTION: Draws a yellow circle centered at (123, 221) with radius 35.
; PLAN: r0=123(x), r1=221(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 221
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
