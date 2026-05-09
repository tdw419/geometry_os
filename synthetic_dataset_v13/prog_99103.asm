; DESCRIPTION: Draws a yellow circle centered at (372, 193) with radius 59.
; PLAN: r0=372(x), r1=193(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 193
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
