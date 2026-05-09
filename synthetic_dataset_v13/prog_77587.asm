; DESCRIPTION: Composite: Draws a cyan rectangle at (260, 127) with width 109 and height 84 then Places a black dot at position (77, 49) then Renders a white disk with center (155, 116) and radius 20.
; PLAN: r0=260(x), r1=127(y), r2=109(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=77(x), r6=49(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=155(x), r11=116(y), r12=20(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 260
LDI r1, 127
LDI r2, 109
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 49
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 155
LDI r11, 116
LDI r12, 20
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
