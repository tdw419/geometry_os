; DESCRIPTION: Composite: Creates a purple rectangular region at (282, 19) spanning 91 by 42 pixels then Renders a white disk with center (76, 123) and radius 72 then Draws a yellow line from (458, 75) to (165, 164).
; PLAN: r0=282(x), r1=19(y), r2=91(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=76(x), r6=123(y), r7=72(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=458(x1), r11=75(y1), r12=165(x2), r13=164(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 282
LDI r1, 19
LDI r2, 91
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 123
LDI r7, 72
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 458
LDI r11, 75
LDI r12, 165
LDI r13, 164
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
