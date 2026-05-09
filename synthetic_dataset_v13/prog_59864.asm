; DESCRIPTION: Composite: Draws a purple rectangle at (426, 127) with width 40 and height 76 then Places a black line segment connecting (207, 75) to (8, 24) then Renders a black disk with center (140, 98) and radius 75.
; PLAN: r0=426(x), r1=127(y), r2=40(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=207(x1), r6=75(y1), r7=8(x2), r8=24(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=140(x), r11=98(y), r12=75(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 426
LDI r1, 127
LDI r2, 40
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 75
LDI r7, 8
LDI r8, 24
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 140
LDI r11, 98
LDI r12, 75
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
