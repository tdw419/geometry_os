; DESCRIPTION: Composite: Renders a red box of size 43x17 starting at (91, 63) then Places a blue dot at position (198, 146) then Draws a purple circle centered at (147, 97) with radius 22.
; PLAN: r0=91(x), r1=63(y), r2=43(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=198(x), r6=146(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=147(x), r11=97(y), r12=22(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 91
LDI r1, 63
LDI r2, 43
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 146
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 147
LDI r11, 97
LDI r12, 22
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
