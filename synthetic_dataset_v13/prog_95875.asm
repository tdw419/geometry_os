; DESCRIPTION: Composite: Creates a magenta rectangular region at (315, 53) spanning 88 by 72 pixels then Places a green dot at position (314, 130) then Places a blue line segment connecting (107, 143) to (76, 226).
; PLAN: r0=315(x), r1=53(y), r2=88(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=314(x), r6=130(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=107(x1), r11=143(y1), r12=76(x2), r13=226(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 315
LDI r1, 53
LDI r2, 88
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 130
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 107
LDI r11, 143
LDI r12, 76
LDI r13, 226
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
