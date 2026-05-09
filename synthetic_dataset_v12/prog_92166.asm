; DESCRIPTION: Draws a green circle centered at (287, 214) with radius 25.
; PLAN: r0=287(x), r1=214(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 214
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
