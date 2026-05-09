; DESCRIPTION: Composite: Draws a cyan line from (214, 121) to (33, 5) then Draws a blue rectangle at (311, 136) with width 69 and height 31 then Draws a purple circle centered at (268, 144) with radius 66.
; PLAN: r0=214(x1), r1=121(y1), r2=33(x2), r3=5(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=311(x), r6=136(y), r7=69(width), r8=31(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=268(x), r11=144(y), r12=66(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 214
LDI r1, 121
LDI r2, 33
LDI r3, 5
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 136
LDI r7, 69
LDI r8, 31
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 268
LDI r11, 144
LDI r12, 66
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
