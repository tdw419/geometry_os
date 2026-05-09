; DESCRIPTION: Composite: Renders a blue line between points (381, 51) and (384, 30) then Draws a white circle centered at (175, 154) with radius 35 then Renders a blue box of size 85x81 starting at (69, 15).
; PLAN: r0=381(x1), r1=51(y1), r2=384(x2), r3=30(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=175(x), r6=154(y), r7=35(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=69(x), r11=15(y), r12=85(width), r13=81(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 381
LDI r1, 51
LDI r2, 384
LDI r3, 30
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 154
LDI r7, 35
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 69
LDI r11, 15
LDI r12, 85
LDI r13, 81
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
