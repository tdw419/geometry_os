; DESCRIPTION: Composite: Places a blue dot at position (55, 183) then Places a orange circle of radius 59 at center (67, 91) then Draws a red rectangle at (18, 135) with width 111 and height 79.
; PLAN: r0=55(x), r1=183(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=67(x), r6=91(y), r7=59(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=18(x), r11=135(y), r12=111(width), r13=79(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 55
LDI r1, 183
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 67
LDI r6, 91
LDI r7, 59
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 18
LDI r11, 135
LDI r12, 111
LDI r13, 79
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
