; DESCRIPTION: Composite: Places a blue dot at position (133, 160) then Renders a white disk with center (378, 193) and radius 46 then Draws a magenta rectangle at (291, 160) with width 75 and height 40.
; PLAN: r0=133(x), r1=160(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=378(x), r6=193(y), r7=46(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=291(x), r11=160(y), r12=75(width), r13=40(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 133
LDI r1, 160
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 378
LDI r6, 193
LDI r7, 46
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 291
LDI r11, 160
LDI r12, 75
LDI r13, 40
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
