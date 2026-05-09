; DESCRIPTION: Composite: Draws a yellow circle centered at (384, 67) with radius 52 then Places a purple dot at position (61, 11).
; PLAN: r0=384(x), r1=67(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=61(x), r6=11(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 384
LDI r1, 67
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 61
LDI r6, 11
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
