; DESCRIPTION: Draws a yellow circle centered at (19, 229) with radius 10.
; PLAN: r0=19(x), r1=229(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 19
LDI r1, 229
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
