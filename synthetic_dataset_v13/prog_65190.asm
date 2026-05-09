; DESCRIPTION: Composite: Places a red line segment connecting (111, 226) to (88, 166) then Draws a purple circle centered at (396, 152) with radius 60 then Draws a cyan rectangle at (119, 39) with width 100 and height 118.
; PLAN: r0=111(x1), r1=226(y1), r2=88(x2), r3=166(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=396(x), r6=152(y), r7=60(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=119(x), r11=39(y), r12=100(width), r13=118(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 111
LDI r1, 226
LDI r2, 88
LDI r3, 166
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 152
LDI r7, 60
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 119
LDI r11, 39
LDI r12, 100
LDI r13, 118
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
