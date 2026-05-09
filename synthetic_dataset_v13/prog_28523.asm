; DESCRIPTION: Composite: Creates a blue rectangular region at (314, 184) spanning 60 by 42 pixels then Draws a magenta line from (360, 206) to (299, 35) then Renders a blue disk with center (249, 184) and radius 67.
; PLAN: r0=314(x), r1=184(y), r2=60(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=360(x1), r6=206(y1), r7=299(x2), r8=35(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=249(x), r11=184(y), r12=67(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 314
LDI r1, 184
LDI r2, 60
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 206
LDI r7, 299
LDI r8, 35
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 249
LDI r11, 184
LDI r12, 67
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
