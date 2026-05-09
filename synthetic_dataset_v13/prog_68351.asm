; DESCRIPTION: Composite: Places a magenta dot at position (486, 122) then Renders a yellow line between points (474, 185) and (465, 70) then Draws a green rectangle at (189, 160) with width 10 and height 65.
; PLAN: r0=486(x), r1=122(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=474(x1), r6=185(y1), r7=465(x2), r8=70(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=189(x), r11=160(y), r12=10(width), r13=65(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 486
LDI r1, 122
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 474
LDI r6, 185
LDI r7, 465
LDI r8, 70
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 189
LDI r11, 160
LDI r12, 10
LDI r13, 65
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
