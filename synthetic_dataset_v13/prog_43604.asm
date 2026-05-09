; DESCRIPTION: Composite: Sets a single magenta pixel at (181, 193) then Places a orange 69x11 rectangle at position (137, 161) then Draws a blue circle centered at (347, 67) with radius 50.
; PLAN: r0=181(x), r1=193(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=137(x), r6=161(y), r7=69(width), r8=11(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=347(x), r11=67(y), r12=50(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 181
LDI r1, 193
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 137
LDI r6, 161
LDI r7, 69
LDI r8, 11
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 347
LDI r11, 67
LDI r12, 50
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
