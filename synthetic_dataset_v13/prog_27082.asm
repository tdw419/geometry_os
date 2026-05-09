; DESCRIPTION: Composite: Renders a red box of size 70x88 starting at (284, 35) then Draws a white circle centered at (381, 135) with radius 73 then Places a blue line segment connecting (486, 93) to (58, 160).
; PLAN: r0=284(x), r1=35(y), r2=70(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=381(x), r6=135(y), r7=73(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=486(x1), r11=93(y1), r12=58(x2), r13=160(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 284
LDI r1, 35
LDI r2, 70
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 135
LDI r7, 73
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 486
LDI r11, 93
LDI r12, 58
LDI r13, 160
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
