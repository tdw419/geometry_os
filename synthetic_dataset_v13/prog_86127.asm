; DESCRIPTION: Composite: Places a yellow dot at position (381, 18) then Draws a purple rectangle at (316, 141) with width 28 and height 58 then Draws a green circle centered at (453, 112) with radius 33.
; PLAN: r0=381(x), r1=18(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=316(x), r6=141(y), r7=28(width), r8=58(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=453(x), r11=112(y), r12=33(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 381
LDI r1, 18
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 316
LDI r6, 141
LDI r7, 28
LDI r8, 58
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 453
LDI r11, 112
LDI r12, 33
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
