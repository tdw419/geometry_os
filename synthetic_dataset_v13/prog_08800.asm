; DESCRIPTION: Composite: Places a green dot at position (273, 226) then Draws a purple rectangle at (170, 111) with width 56 and height 108 then Places a green circle of radius 69 at center (96, 83).
; PLAN: r0=273(x), r1=226(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=170(x), r6=111(y), r7=56(width), r8=108(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=96(x), r11=83(y), r12=69(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 273
LDI r1, 226
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 170
LDI r6, 111
LDI r7, 56
LDI r8, 108
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 96
LDI r11, 83
LDI r12, 69
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
