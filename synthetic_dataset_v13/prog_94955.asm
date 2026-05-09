; DESCRIPTION: Composite: Creates a cyan rectangular region at (381, 14) spanning 71 by 78 pixels then Draws a green circle centered at (393, 158) with radius 42 then Renders a blue line between points (15, 49) and (439, 137).
; PLAN: r0=381(x), r1=14(y), r2=71(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=393(x), r6=158(y), r7=42(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=15(x1), r11=49(y1), r12=439(x2), r13=137(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 381
LDI r1, 14
LDI r2, 71
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 158
LDI r7, 42
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 15
LDI r11, 49
LDI r12, 439
LDI r13, 137
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
