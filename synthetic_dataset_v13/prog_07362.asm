; DESCRIPTION: Composite: Draws a blue circle centered at (350, 163) with radius 46 then Renders a magenta line between points (379, 195) and (35, 189) then Creates a cyan rectangular region at (172, 180) spanning 20 by 56 pixels.
; PLAN: r0=350(x), r1=163(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=379(x1), r6=195(y1), r7=35(x2), r8=189(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=172(x), r11=180(y), r12=20(width), r13=56(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 350
LDI r1, 163
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 379
LDI r6, 195
LDI r7, 35
LDI r8, 189
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 172
LDI r11, 180
LDI r12, 20
LDI r13, 56
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
