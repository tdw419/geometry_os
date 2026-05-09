; DESCRIPTION: Composite: Sets a single purple pixel at (132, 91) then Draws a green rectangle at (266, 160) with width 61 and height 55 then Draws a purple circle centered at (129, 138) with radius 72.
; PLAN: r0=132(x), r1=91(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=266(x), r6=160(y), r7=61(width), r8=55(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=129(x), r11=138(y), r12=72(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 132
LDI r1, 91
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 266
LDI r6, 160
LDI r7, 61
LDI r8, 55
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 129
LDI r11, 138
LDI r12, 72
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
