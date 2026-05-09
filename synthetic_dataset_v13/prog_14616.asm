; DESCRIPTION: Composite: Sets a single red pixel at (296, 39) then Draws a green rectangle at (207, 144) with width 97 and height 108 then Creates a purple circular shape at (287, 204) with radius 17.
; PLAN: r0=296(x), r1=39(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=207(x), r6=144(y), r7=97(width), r8=108(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=287(x), r11=204(y), r12=17(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 296
LDI r1, 39
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 207
LDI r6, 144
LDI r7, 97
LDI r8, 108
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 287
LDI r11, 204
LDI r12, 17
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
