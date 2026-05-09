; DESCRIPTION: Composite: Renders a magenta line between points (424, 106) and (384, 199) then Creates a magenta circular shape at (205, 166) with radius 25 then Draws a red rectangle at (141, 31) with width 46 and height 116.
; PLAN: r0=424(x1), r1=106(y1), r2=384(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=205(x), r6=166(y), r7=25(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=141(x), r11=31(y), r12=46(width), r13=116(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 424
LDI r1, 106
LDI r2, 384
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 166
LDI r7, 25
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 141
LDI r11, 31
LDI r12, 46
LDI r13, 116
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
