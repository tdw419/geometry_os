; DESCRIPTION: Composite: Places a magenta dot at position (400, 17) then Renders a black disk with center (144, 164) and radius 33 then Draws a white rectangle at (44, 1) with width 86 and height 111.
; PLAN: r0=400(x), r1=17(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=144(x), r6=164(y), r7=33(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=44(x), r11=1(y), r12=86(width), r13=111(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 400
LDI r1, 17
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 144
LDI r6, 164
LDI r7, 33
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 44
LDI r11, 1
LDI r12, 86
LDI r13, 111
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
