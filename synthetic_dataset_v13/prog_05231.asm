; DESCRIPTION: Composite: Sets a single black pixel at (248, 17) then Draws a yellow rectangle at (321, 106) with width 84 and height 46 then Draws a magenta circle centered at (338, 74) with radius 35.
; PLAN: r0=248(x), r1=17(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=321(x), r6=106(y), r7=84(width), r8=46(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=338(x), r11=74(y), r12=35(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 248
LDI r1, 17
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 321
LDI r6, 106
LDI r7, 84
LDI r8, 46
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 338
LDI r11, 74
LDI r12, 35
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
