; DESCRIPTION: Composite: Renders a white box of size 83x94 starting at (364, 101) then Draws a blue circle centered at (116, 59) with radius 36.
; PLAN: r0=364(x), r1=101(y), r2=83(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=116(x), r6=59(y), r7=36(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 364
LDI r1, 101
LDI r2, 83
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 59
LDI r7, 36
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
