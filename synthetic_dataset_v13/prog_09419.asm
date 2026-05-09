; DESCRIPTION: Composite: Draws a blue line from (147, 172) to (333, 61) then Renders a white disk with center (69, 67) and radius 44 then Draws a green rectangle at (331, 46) with width 111 and height 87.
; PLAN: r0=147(x1), r1=172(y1), r2=333(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=69(x), r6=67(y), r7=44(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=331(x), r11=46(y), r12=111(width), r13=87(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 147
LDI r1, 172
LDI r2, 333
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 67
LDI r7, 44
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 331
LDI r11, 46
LDI r12, 111
LDI r13, 87
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
