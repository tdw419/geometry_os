; DESCRIPTION: Composite: Draws a black rectangle at (364, 67) with width 30 and height 119 then Sets a single red pixel at (393, 109).
; PLAN: r0=364(x), r1=67(y), r2=30(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=393(x), r6=109(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 364
LDI r1, 67
LDI r2, 30
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 109
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
