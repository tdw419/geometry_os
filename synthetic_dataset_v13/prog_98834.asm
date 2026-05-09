; DESCRIPTION: Composite: Places a black circle of radius 66 at center (299, 149) then Places a green line segment connecting (393, 171) to (150, 104) then Draws a blue rectangle at (3, 146) with width 83 and height 54.
; PLAN: r0=299(x), r1=149(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=393(x1), r6=171(y1), r7=150(x2), r8=104(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=3(x), r11=146(y), r12=83(width), r13=54(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 299
LDI r1, 149
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 393
LDI r6, 171
LDI r7, 150
LDI r8, 104
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 3
LDI r11, 146
LDI r12, 83
LDI r13, 54
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
