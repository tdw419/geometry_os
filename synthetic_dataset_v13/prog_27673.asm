; DESCRIPTION: Composite: Draws a white circle centered at (408, 64) with radius 50 then Renders a blue line between points (32, 121) and (316, 179) then Draws a blue rectangle at (234, 39) with width 106 and height 19.
; PLAN: r0=408(x), r1=64(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=32(x1), r6=121(y1), r7=316(x2), r8=179(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=234(x), r11=39(y), r12=106(width), r13=19(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 408
LDI r1, 64
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 32
LDI r6, 121
LDI r7, 316
LDI r8, 179
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 234
LDI r11, 39
LDI r12, 106
LDI r13, 19
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
