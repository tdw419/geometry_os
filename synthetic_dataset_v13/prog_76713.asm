; DESCRIPTION: Composite: Places a orange dot at position (38, 92) then Draws a magenta circle centered at (341, 163) with radius 59 then Draws a yellow rectangle at (322, 185) with width 101 and height 22.
; PLAN: r0=38(x), r1=92(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=341(x), r6=163(y), r7=59(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=322(x), r11=185(y), r12=101(width), r13=22(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 38
LDI r1, 92
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 341
LDI r6, 163
LDI r7, 59
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 322
LDI r11, 185
LDI r12, 101
LDI r13, 22
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
