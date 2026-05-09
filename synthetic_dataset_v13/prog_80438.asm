; DESCRIPTION: Composite: Places a blue line segment connecting (217, 76) to (496, 144) then Draws a purple rectangle at (104, 177) with width 113 and height 31 then Draws a red circle centered at (317, 146) with radius 21.
; PLAN: r0=217(x1), r1=76(y1), r2=496(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=104(x), r6=177(y), r7=113(width), r8=31(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=317(x), r11=146(y), r12=21(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 217
LDI r1, 76
LDI r2, 496
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 177
LDI r7, 113
LDI r8, 31
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 317
LDI r11, 146
LDI r12, 21
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
