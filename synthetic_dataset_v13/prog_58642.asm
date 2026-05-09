; DESCRIPTION: Draws a black circle centered at (200, 228) with radius 22.
; PLAN: r0=200(x), r1=228(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 228
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
