; DESCRIPTION: Composite: Creates a magenta rectangular region at (55, 56) spanning 43 by 94 pixels then Draws a green circle centered at (472, 65) with radius 27 then Places a magenta line segment connecting (180, 48) to (254, 249).
; PLAN: r0=55(x), r1=56(y), r2=43(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=472(x), r6=65(y), r7=27(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=180(x1), r11=48(y1), r12=254(x2), r13=249(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 55
LDI r1, 56
LDI r2, 43
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 472
LDI r6, 65
LDI r7, 27
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 180
LDI r11, 48
LDI r12, 254
LDI r13, 249
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
