; DESCRIPTION: Composite: Sets a single red pixel at (126, 119) then Renders a white disk with center (132, 188) and radius 24 then Draws a red rectangle at (262, 154) with width 16 and height 29.
; PLAN: r0=126(x), r1=119(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=132(x), r6=188(y), r7=24(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=262(x), r11=154(y), r12=16(width), r13=29(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 126
LDI r1, 119
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 132
LDI r6, 188
LDI r7, 24
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 262
LDI r11, 154
LDI r12, 16
LDI r13, 29
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
