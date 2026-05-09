; DESCRIPTION: Composite: Draws a cyan rectangle at (332, 56) with width 28 and height 26 then Places a green dot at position (248, 112) then Draws a green circle centered at (389, 102) with radius 74.
; PLAN: r0=332(x), r1=56(y), r2=28(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=248(x), r6=112(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=389(x), r11=102(y), r12=74(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 332
LDI r1, 56
LDI r2, 28
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 112
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 389
LDI r11, 102
LDI r12, 74
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
