; DESCRIPTION: Composite: Draws a white line from (154, 185) to (76, 156) then Sets a single white pixel at (358, 88) then Draws a blue rectangle at (304, 115) with width 53 and height 98.
; PLAN: r0=154(x1), r1=185(y1), r2=76(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=358(x), r6=88(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=304(x), r11=115(y), r12=53(width), r13=98(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 154
LDI r1, 185
LDI r2, 76
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 88
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 304
LDI r11, 115
LDI r12, 53
LDI r13, 98
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
