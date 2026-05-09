; DESCRIPTION: Composite: Sets a single white pixel at (51, 104) then Creates a magenta circular shape at (460, 46) with radius 37 then Draws a orange rectangle at (211, 25) with width 17 and height 109.
; PLAN: r0=51(x), r1=104(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=460(x), r6=46(y), r7=37(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=211(x), r11=25(y), r12=17(width), r13=109(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 51
LDI r1, 104
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 460
LDI r6, 46
LDI r7, 37
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 211
LDI r11, 25
LDI r12, 17
LDI r13, 109
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
