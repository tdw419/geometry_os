; DESCRIPTION: Composite: Places a red 49x77 rectangle at position (237, 55) then Renders a magenta disk with center (95, 164) and radius 30 then Draws a orange line from (99, 45) to (189, 217).
; PLAN: r0=237(x), r1=55(y), r2=49(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=95(x), r6=164(y), r7=30(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=99(x1), r11=45(y1), r12=189(x2), r13=217(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 237
LDI r1, 55
LDI r2, 49
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 164
LDI r7, 30
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 99
LDI r11, 45
LDI r12, 189
LDI r13, 217
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
