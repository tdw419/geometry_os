; DESCRIPTION: Composite: Places a white circle of radius 10 at center (479, 89) then Draws a cyan line from (455, 172) to (386, 136) then Draws a blue rectangle at (344, 104) with width 101 and height 99.
; PLAN: r0=479(x), r1=89(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=455(x1), r6=172(y1), r7=386(x2), r8=136(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=344(x), r11=104(y), r12=101(width), r13=99(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 479
LDI r1, 89
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 455
LDI r6, 172
LDI r7, 386
LDI r8, 136
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 344
LDI r11, 104
LDI r12, 101
LDI r13, 99
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
