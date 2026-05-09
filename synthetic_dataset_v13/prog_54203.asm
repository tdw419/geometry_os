; DESCRIPTION: Composite: Draws a purple circle centered at (171, 224) with radius 26 then Sets a single purple pixel at (36, 27) then Draws a purple rectangle at (116, 44) with width 17 and height 111.
; PLAN: r0=171(x), r1=224(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=36(x), r6=27(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=116(x), r11=44(y), r12=17(width), r13=111(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 171
LDI r1, 224
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 36
LDI r6, 27
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 116
LDI r11, 44
LDI r12, 17
LDI r13, 111
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
