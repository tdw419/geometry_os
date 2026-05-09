; DESCRIPTION: Composite: Draws a purple line from (128, 147) to (291, 18) then Draws a orange circle centered at (138, 73) with radius 67 then Renders a magenta box of size 120x49 starting at (100, 89).
; PLAN: r0=128(x1), r1=147(y1), r2=291(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=138(x), r6=73(y), r7=67(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=100(x), r11=89(y), r12=120(width), r13=49(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 128
LDI r1, 147
LDI r2, 291
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 73
LDI r7, 67
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 100
LDI r11, 89
LDI r12, 120
LDI r13, 49
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
