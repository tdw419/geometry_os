; DESCRIPTION: Composite: Places a green dot at position (337, 106) then Draws a orange rectangle at (147, 172) with width 102 and height 42 then Places a black line segment connecting (203, 138) to (132, 53).
; PLAN: r0=337(x), r1=106(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=147(x), r6=172(y), r7=102(width), r8=42(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=203(x1), r11=138(y1), r12=132(x2), r13=53(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 337
LDI r1, 106
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 147
LDI r6, 172
LDI r7, 102
LDI r8, 42
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 203
LDI r11, 138
LDI r12, 132
LDI r13, 53
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
