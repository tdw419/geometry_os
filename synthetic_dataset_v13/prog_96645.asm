; DESCRIPTION: Composite: Draws a yellow rectangle at (219, 36) with width 60 and height 66 then Sets a single black pixel at (414, 130).
; PLAN: r0=219(x), r1=36(y), r2=60(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=414(x), r6=130(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 219
LDI r1, 36
LDI r2, 60
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 130
LDI r7, 0x000000
PSET r5, r6, r7
HALT
