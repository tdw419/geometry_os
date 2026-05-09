; DESCRIPTION: Composite: Sets a single magenta pixel at (347, 143) then Places a magenta 40x41 rectangle at position (112, 164) then Draws a magenta circle centered at (228, 199) with radius 36.
; PLAN: r0=347(x), r1=143(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=112(x), r6=164(y), r7=40(width), r8=41(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=228(x), r11=199(y), r12=36(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 347
LDI r1, 143
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 112
LDI r6, 164
LDI r7, 40
LDI r8, 41
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 228
LDI r11, 199
LDI r12, 36
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
