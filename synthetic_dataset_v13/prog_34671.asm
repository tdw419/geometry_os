; DESCRIPTION: Composite: Places a cyan dot at position (3, 241) then Draws a white rectangle at (408, 91) with width 90 and height 106 then Draws a white circle centered at (319, 198) with radius 19.
; PLAN: r0=3(x), r1=241(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=408(x), r6=91(y), r7=90(width), r8=106(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=319(x), r11=198(y), r12=19(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 3
LDI r1, 241
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 408
LDI r6, 91
LDI r7, 90
LDI r8, 106
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 319
LDI r11, 198
LDI r12, 19
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
