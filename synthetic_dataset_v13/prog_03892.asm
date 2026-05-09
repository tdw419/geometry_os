; DESCRIPTION: Composite: Draws a yellow line from (35, 67) to (150, 47) then Creates a yellow rectangular region at (254, 69) spanning 42 by 74 pixels then Draws a blue circle centered at (308, 123) with radius 42.
; PLAN: r0=35(x1), r1=67(y1), r2=150(x2), r3=47(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=254(x), r6=69(y), r7=42(width), r8=74(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=308(x), r11=123(y), r12=42(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 35
LDI r1, 67
LDI r2, 150
LDI r3, 47
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 69
LDI r7, 42
LDI r8, 74
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 308
LDI r11, 123
LDI r12, 42
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
