; DESCRIPTION: Draws a black circle centered at (404, 158) with radius 14.
; PLAN: r0=404(x), r1=158(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 158
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
