; DESCRIPTION: Draws a yellow circle centered at (123, 214) with radius 36.
; PLAN: r0=123(x), r1=214(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 214
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
