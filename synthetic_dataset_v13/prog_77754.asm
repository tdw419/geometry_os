; DESCRIPTION: Composite: Sets a single orange pixel at (30, 166) then Renders a orange disk with center (114, 173) and radius 76 then Draws a black rectangle at (296, 135) with width 111 and height 111.
; PLAN: r0=30(x), r1=166(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=114(x), r6=173(y), r7=76(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=296(x), r11=135(y), r12=111(width), r13=111(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 30
LDI r1, 166
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 114
LDI r6, 173
LDI r7, 76
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 296
LDI r11, 135
LDI r12, 111
LDI r13, 111
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
