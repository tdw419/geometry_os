; DESCRIPTION: Composite: Creates a blue rectangular region at (143, 210) spanning 69 by 19 pixels then Creates a blue circular shape at (397, 143) with radius 80 then Renders a magenta line between points (473, 148) and (29, 83).
; PLAN: r0=143(x), r1=210(y), r2=69(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=397(x), r6=143(y), r7=80(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=473(x1), r11=148(y1), r12=29(x2), r13=83(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 143
LDI r1, 210
LDI r2, 69
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 143
LDI r7, 80
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 473
LDI r11, 148
LDI r12, 29
LDI r13, 83
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
