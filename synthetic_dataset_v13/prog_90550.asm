; DESCRIPTION: Composite: Draws a white circle centered at (65, 116) with radius 53 then Draws a black rectangle at (340, 0) with width 60 and height 75 then Places a yellow line segment connecting (120, 75) to (385, 237).
; PLAN: r0=65(x), r1=116(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=340(x), r6=0(y), r7=60(width), r8=75(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=120(x1), r11=75(y1), r12=385(x2), r13=237(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 65
LDI r1, 116
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 340
LDI r6, 0
LDI r7, 60
LDI r8, 75
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 120
LDI r11, 75
LDI r12, 385
LDI r13, 237
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
