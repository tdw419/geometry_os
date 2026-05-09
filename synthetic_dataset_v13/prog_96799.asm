; DESCRIPTION: Composite: Sets a single yellow pixel at (376, 135) then Draws a yellow circle centered at (228, 148) with radius 41 then Draws a red rectangle at (221, 69) with width 104 and height 113.
; PLAN: r0=376(x), r1=135(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=228(x), r6=148(y), r7=41(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=221(x), r11=69(y), r12=104(width), r13=113(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 376
LDI r1, 135
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 228
LDI r6, 148
LDI r7, 41
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 221
LDI r11, 69
LDI r12, 104
LDI r13, 113
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
