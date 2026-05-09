; DESCRIPTION: Composite: Places a cyan dot at position (347, 224) then Draws a blue rectangle at (200, 68) with width 65 and height 109 then Draws a purple circle centered at (303, 179) with radius 62.
; PLAN: r0=347(x), r1=224(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=200(x), r6=68(y), r7=65(width), r8=109(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=303(x), r11=179(y), r12=62(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 347
LDI r1, 224
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 200
LDI r6, 68
LDI r7, 65
LDI r8, 109
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 303
LDI r11, 179
LDI r12, 62
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
