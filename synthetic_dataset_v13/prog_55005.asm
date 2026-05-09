; DESCRIPTION: Composite: Places a orange dot at position (119, 249) then Draws a blue line from (116, 121) to (204, 24) then Draws a yellow rectangle at (313, 147) with width 106 and height 42.
; PLAN: r0=119(x), r1=249(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=116(x1), r6=121(y1), r7=204(x2), r8=24(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=313(x), r11=147(y), r12=106(width), r13=42(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 119
LDI r1, 249
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 116
LDI r6, 121
LDI r7, 204
LDI r8, 24
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 313
LDI r11, 147
LDI r12, 106
LDI r13, 42
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
