; DESCRIPTION: Draws a yellow circle centered at (262, 28) with radius 22.
; PLAN: r0=262(x), r1=28(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 28
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
