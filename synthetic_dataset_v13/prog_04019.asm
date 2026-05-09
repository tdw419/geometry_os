; DESCRIPTION: Composite: Renders a blue disk with center (408, 97) and radius 62 then Draws a green rectangle at (100, 135) with width 113 and height 97 then Places a black dot at position (398, 49).
; PLAN: r0=408(x), r1=97(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=100(x), r6=135(y), r7=113(width), r8=97(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=398(x), r11=49(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 408
LDI r1, 97
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 100
LDI r6, 135
LDI r7, 113
LDI r8, 97
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 398
LDI r11, 49
LDI r12, 0x000000
PSET r10, r11, r12
HALT
