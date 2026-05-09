; DESCRIPTION: Draws a green circle centered at (387, 158) with radius 19.
; PLAN: r0=387(x), r1=158(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 158
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
