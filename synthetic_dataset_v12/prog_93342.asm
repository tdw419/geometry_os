; DESCRIPTION: Composite: Draws a black line from (411, 19) to (144, 138) then Places a black 109x15 rectangle at position (66, 6) then Places a orange circle of radius 65 at center (72, 169).
; PLAN: r0=411(x1), r1=19(y1), r2=144(x2), r3=138(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=66(x), r6=6(y), r7=109(width), r8=15(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=72(x), r11=169(y), r12=65(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 411
LDI r1, 19
LDI r2, 144
LDI r3, 138
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 6
LDI r7, 109
LDI r8, 15
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 72
LDI r11, 169
LDI r12, 65
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
