; DESCRIPTION: Composite: Places a yellow dot at position (223, 136) then Draws a green rectangle at (260, 102) with width 117 and height 105 then Renders a black disk with center (182, 142) and radius 48.
; PLAN: r0=223(x), r1=136(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=260(x), r6=102(y), r7=117(width), r8=105(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=182(x), r11=142(y), r12=48(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 223
LDI r1, 136
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 260
LDI r6, 102
LDI r7, 117
LDI r8, 105
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 182
LDI r11, 142
LDI r12, 48
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
