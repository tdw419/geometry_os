; DESCRIPTION: Draws a blue circle centered at (341, 182) with radius 50.
; PLAN: r0=341(x), r1=182(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 182
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
