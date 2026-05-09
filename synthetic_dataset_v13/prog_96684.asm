; DESCRIPTION: Composite: Creates a magenta rectangular region at (40, 184) spanning 87 by 17 pixels then Draws a white line from (151, 248) to (233, 79) then Draws a blue circle centered at (256, 177) with radius 55.
; PLAN: r0=40(x), r1=184(y), r2=87(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=151(x1), r6=248(y1), r7=233(x2), r8=79(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=256(x), r11=177(y), r12=55(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 40
LDI r1, 184
LDI r2, 87
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 248
LDI r7, 233
LDI r8, 79
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 256
LDI r11, 177
LDI r12, 55
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
