; DESCRIPTION: Composite: Renders a purple box of size 40x33 starting at (264, 155) then Places a purple dot at position (379, 131) then Draws a cyan circle centered at (248, 78) with radius 43.
; PLAN: r0=264(x), r1=155(y), r2=40(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=379(x), r6=131(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=248(x), r11=78(y), r12=43(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 264
LDI r1, 155
LDI r2, 40
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 131
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 248
LDI r11, 78
LDI r12, 43
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
