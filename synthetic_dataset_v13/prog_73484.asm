; DESCRIPTION: Composite: Draws a magenta line from (77, 107) to (17, 120) then Draws a blue circle centered at (232, 213) with radius 22 then Creates a purple rectangular region at (327, 53) spanning 106 by 113 pixels.
; PLAN: r0=77(x1), r1=107(y1), r2=17(x2), r3=120(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=232(x), r6=213(y), r7=22(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=327(x), r11=53(y), r12=106(width), r13=113(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 77
LDI r1, 107
LDI r2, 17
LDI r3, 120
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 213
LDI r7, 22
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 327
LDI r11, 53
LDI r12, 106
LDI r13, 113
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
