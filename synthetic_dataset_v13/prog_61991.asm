; DESCRIPTION: Composite: Sets a single purple pixel at (209, 51) then Renders a yellow disk with center (163, 144) and radius 78 then Draws a red rectangle at (49, 37) with width 43 and height 19.
; PLAN: r0=209(x), r1=51(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=163(x), r6=144(y), r7=78(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=49(x), r11=37(y), r12=43(width), r13=19(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 209
LDI r1, 51
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 163
LDI r6, 144
LDI r7, 78
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 49
LDI r11, 37
LDI r12, 43
LDI r13, 19
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
