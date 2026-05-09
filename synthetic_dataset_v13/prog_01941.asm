; DESCRIPTION: Composite: Places a yellow dot at position (53, 96) then Draws a yellow rectangle at (125, 5) with width 118 and height 52 then Renders a magenta disk with center (284, 156) and radius 41.
; PLAN: r0=53(x), r1=96(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=125(x), r6=5(y), r7=118(width), r8=52(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=284(x), r11=156(y), r12=41(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 53
LDI r1, 96
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 125
LDI r6, 5
LDI r7, 118
LDI r8, 52
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 284
LDI r11, 156
LDI r12, 41
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
