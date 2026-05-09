; DESCRIPTION: Composite: Draws a magenta circle centered at (170, 172) with radius 47 then Renders a purple line between points (3, 252) and (222, 111) then Creates a magenta rectangular region at (394, 191) spanning 20 by 42 pixels.
; PLAN: r0=170(x), r1=172(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=3(x1), r6=252(y1), r7=222(x2), r8=111(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=394(x), r11=191(y), r12=20(width), r13=42(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 170
LDI r1, 172
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 3
LDI r6, 252
LDI r7, 222
LDI r8, 111
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 394
LDI r11, 191
LDI r12, 20
LDI r13, 42
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
