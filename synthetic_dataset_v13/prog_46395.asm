; DESCRIPTION: Composite: Creates a yellow rectangular region at (375, 165) spanning 59 by 42 pixels then Places a magenta line segment connecting (171, 79) to (25, 40) then Draws a black circle centered at (322, 152) with radius 42.
; PLAN: r0=375(x), r1=165(y), r2=59(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=171(x1), r6=79(y1), r7=25(x2), r8=40(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=322(x), r11=152(y), r12=42(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 375
LDI r1, 165
LDI r2, 59
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 79
LDI r7, 25
LDI r8, 40
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 322
LDI r11, 152
LDI r12, 42
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
