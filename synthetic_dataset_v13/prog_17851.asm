; DESCRIPTION: Composite: Places a black dot at position (247, 249) then Draws a yellow rectangle at (122, 135) with width 51 and height 98 then Places a magenta circle of radius 51 at center (459, 184).
; PLAN: r0=247(x), r1=249(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=122(x), r6=135(y), r7=51(width), r8=98(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=459(x), r11=184(y), r12=51(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 247
LDI r1, 249
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 122
LDI r6, 135
LDI r7, 51
LDI r8, 98
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 459
LDI r11, 184
LDI r12, 51
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
