; DESCRIPTION: Composite: Places a purple dot at position (99, 147) then Draws a magenta rectangle at (212, 69) with width 62 and height 14 then Places a purple line segment connecting (47, 62) to (507, 246).
; PLAN: r0=99(x), r1=147(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=212(x), r6=69(y), r7=62(width), r8=14(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=47(x1), r11=62(y1), r12=507(x2), r13=246(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 99
LDI r1, 147
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 212
LDI r6, 69
LDI r7, 62
LDI r8, 14
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 47
LDI r11, 62
LDI r12, 507
LDI r13, 246
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
