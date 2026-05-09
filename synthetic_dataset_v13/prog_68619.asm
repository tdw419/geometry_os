; DESCRIPTION: Composite: Draws a magenta circle centered at (302, 144) with radius 38 then Places a black dot at position (202, 131) then Draws a blue rectangle at (108, 49) with width 43 and height 90.
; PLAN: r0=302(x), r1=144(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=202(x), r6=131(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=108(x), r11=49(y), r12=43(width), r13=90(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 302
LDI r1, 144
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 202
LDI r6, 131
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 108
LDI r11, 49
LDI r12, 43
LDI r13, 90
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
