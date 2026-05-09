; DESCRIPTION: Draws a yellow circle centered at (234, 221) with radius 19.
; PLAN: r0=234(x), r1=221(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 221
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
