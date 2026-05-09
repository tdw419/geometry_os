; DESCRIPTION: Composite: Renders a white disk with center (140, 160) and radius 27 then Places a white dot at position (261, 111) then Draws a green rectangle at (16, 163) with width 109 and height 91.
; PLAN: r0=140(x), r1=160(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=261(x), r6=111(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=16(x), r11=163(y), r12=109(width), r13=91(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 140
LDI r1, 160
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 261
LDI r6, 111
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 16
LDI r11, 163
LDI r12, 109
LDI r13, 91
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
