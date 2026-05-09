; DESCRIPTION: Composite: Places a green line segment connecting (342, 95) to (178, 248) then Draws a white circle centered at (312, 139) with radius 46 then Draws a red rectangle at (284, 32) with width 23 and height 38.
; PLAN: r0=342(x1), r1=95(y1), r2=178(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=312(x), r6=139(y), r7=46(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=284(x), r11=32(y), r12=23(width), r13=38(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 342
LDI r1, 95
LDI r2, 178
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 139
LDI r7, 46
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 284
LDI r11, 32
LDI r12, 23
LDI r13, 38
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
