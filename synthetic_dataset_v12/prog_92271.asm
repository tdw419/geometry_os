; DESCRIPTION: Composite: Draws a black rectangle at (241, 13) with width 117 and height 60 then Places a blue line segment connecting (482, 20) to (340, 221) then Draws a green circle centered at (236, 183) with radius 61.
; PLAN: r0=241(x), r1=13(y), r2=117(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=482(x1), r6=20(y1), r7=340(x2), r8=221(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=236(x), r11=183(y), r12=61(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 241
LDI r1, 13
LDI r2, 117
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 482
LDI r6, 20
LDI r7, 340
LDI r8, 221
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 236
LDI r11, 183
LDI r12, 61
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
