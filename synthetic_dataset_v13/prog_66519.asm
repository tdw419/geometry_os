; DESCRIPTION: Draws a black circle centered at (287, 168) with radius 34.
; PLAN: r0=287(x), r1=168(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 168
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
