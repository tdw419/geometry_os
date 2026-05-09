; DESCRIPTION: Draws a yellow circle centered at (317, 198) with radius 28.
; PLAN: r0=317(x), r1=198(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 198
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
