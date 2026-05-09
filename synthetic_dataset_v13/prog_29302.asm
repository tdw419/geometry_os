; DESCRIPTION: Composite: Renders a orange line between points (357, 197) and (436, 124) then Creates a black circular shape at (124, 167) with radius 38 then Draws a blue rectangle at (369, 111) with width 69 and height 60.
; PLAN: r0=357(x1), r1=197(y1), r2=436(x2), r3=124(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=124(x), r6=167(y), r7=38(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=369(x), r11=111(y), r12=69(width), r13=60(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 357
LDI r1, 197
LDI r2, 436
LDI r3, 124
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 124
LDI r6, 167
LDI r7, 38
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 369
LDI r11, 111
LDI r12, 69
LDI r13, 60
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
