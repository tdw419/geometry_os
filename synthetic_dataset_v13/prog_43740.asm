; DESCRIPTION: Composite: Places a black dot at position (196, 167) then Draws a orange circle centered at (182, 76) with radius 12 then Places a magenta 41x120 rectangle at position (113, 56).
; PLAN: r0=196(x), r1=167(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=182(x), r6=76(y), r7=12(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=113(x), r11=56(y), r12=41(width), r13=120(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 196
LDI r1, 167
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 182
LDI r6, 76
LDI r7, 12
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 113
LDI r11, 56
LDI r12, 41
LDI r13, 120
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
