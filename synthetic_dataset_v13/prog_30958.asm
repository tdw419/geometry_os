; DESCRIPTION: Composite: Places a purple dot at position (488, 28) then Places a orange line segment connecting (100, 146) to (253, 24) then Draws a magenta rectangle at (76, 25) with width 65 and height 96.
; PLAN: r0=488(x), r1=28(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=100(x1), r6=146(y1), r7=253(x2), r8=24(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=76(x), r11=25(y), r12=65(width), r13=96(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 488
LDI r1, 28
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 100
LDI r6, 146
LDI r7, 253
LDI r8, 24
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 76
LDI r11, 25
LDI r12, 65
LDI r13, 96
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
