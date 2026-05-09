; DESCRIPTION: Composite: Places a white dot at position (336, 111) then Places a magenta circle of radius 27 at center (123, 187) then Draws a magenta rectangle at (5, 9) with width 98 and height 52.
; PLAN: r0=336(x), r1=111(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=123(x), r6=187(y), r7=27(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=5(x), r11=9(y), r12=98(width), r13=52(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 336
LDI r1, 111
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 123
LDI r6, 187
LDI r7, 27
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 5
LDI r11, 9
LDI r12, 98
LDI r13, 52
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
