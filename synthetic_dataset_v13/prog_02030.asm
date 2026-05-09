; DESCRIPTION: Composite: Draws a purple rectangle at (82, 159) with width 79 and height 83 then Renders a magenta disk with center (368, 135) and radius 68 then Renders a orange line between points (509, 37) and (391, 86).
; PLAN: r0=82(x), r1=159(y), r2=79(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=368(x), r6=135(y), r7=68(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=509(x1), r11=37(y1), r12=391(x2), r13=86(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 82
LDI r1, 159
LDI r2, 79
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 135
LDI r7, 68
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 509
LDI r11, 37
LDI r12, 391
LDI r13, 86
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
