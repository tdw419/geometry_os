; DESCRIPTION: Composite: Renders a purple line between points (267, 224) and (101, 43) then Places a blue dot at position (177, 217) then Draws a magenta rectangle at (106, 231) with width 66 and height 13.
; PLAN: r0=267(x1), r1=224(y1), r2=101(x2), r3=43(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=177(x), r6=217(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=106(x), r11=231(y), r12=66(width), r13=13(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 267
LDI r1, 224
LDI r2, 101
LDI r3, 43
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 177
LDI r6, 217
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 106
LDI r11, 231
LDI r12, 66
LDI r13, 13
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
