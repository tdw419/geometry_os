; DESCRIPTION: Composite: Sets a single white pixel at (288, 203) then Places a magenta circle of radius 52 at center (315, 80) then Draws a magenta rectangle at (51, 163) with width 25 and height 57.
; PLAN: r0=288(x), r1=203(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=315(x), r6=80(y), r7=52(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=51(x), r11=163(y), r12=25(width), r13=57(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 288
LDI r1, 203
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 315
LDI r6, 80
LDI r7, 52
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 51
LDI r11, 163
LDI r12, 25
LDI r13, 57
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
