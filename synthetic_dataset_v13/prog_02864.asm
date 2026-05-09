; DESCRIPTION: Composite: Renders a white disk with center (136, 173) and radius 26 then Sets a single red pixel at (33, 134) then Draws a green rectangle at (387, 150) with width 24 and height 90.
; PLAN: r0=136(x), r1=173(y), r2=26(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=33(x), r6=134(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=387(x), r11=150(y), r12=24(width), r13=90(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 136
LDI r1, 173
LDI r2, 26
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 33
LDI r6, 134
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 387
LDI r11, 150
LDI r12, 24
LDI r13, 90
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
