; DESCRIPTION: Composite: Draws a yellow line from (394, 13) to (424, 156) then Creates a magenta circular shape at (103, 149) with radius 75 then Renders a red box of size 29x92 starting at (328, 106).
; PLAN: r0=394(x1), r1=13(y1), r2=424(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=149(y), r7=75(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=328(x), r11=106(y), r12=29(width), r13=92(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 394
LDI r1, 13
LDI r2, 424
LDI r3, 156
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 149
LDI r7, 75
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 328
LDI r11, 106
LDI r12, 29
LDI r13, 92
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
