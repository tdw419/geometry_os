; DESCRIPTION: Composite: Sets a single black pixel at (297, 136) then Draws a white rectangle at (387, 134) with width 40 and height 88 then Renders a orange disk with center (196, 104) and radius 78.
; PLAN: r0=297(x), r1=136(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=387(x), r6=134(y), r7=40(width), r8=88(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=196(x), r11=104(y), r12=78(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 297
LDI r1, 136
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 387
LDI r6, 134
LDI r7, 40
LDI r8, 88
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 196
LDI r11, 104
LDI r12, 78
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
