; DESCRIPTION: Composite: Places a black dot at position (330, 67) then Draws a blue circle centered at (318, 165) with radius 36.
; PLAN: r0=330(x), r1=67(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=318(x), r6=165(y), r7=36(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 330
LDI r1, 67
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 318
LDI r6, 165
LDI r7, 36
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
