; DESCRIPTION: Composite: Sets a single blue pixel at (57, 141) then Draws a purple rectangle at (389, 202) with width 31 and height 35 then Draws a green circle centered at (379, 163) with radius 78.
; PLAN: r0=57(x), r1=141(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=389(x), r6=202(y), r7=31(width), r8=35(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=379(x), r11=163(y), r12=78(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 57
LDI r1, 141
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 389
LDI r6, 202
LDI r7, 31
LDI r8, 35
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 379
LDI r11, 163
LDI r12, 78
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
