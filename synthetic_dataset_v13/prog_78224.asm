; DESCRIPTION: Composite: Places a yellow dot at position (178, 55) then Draws a black line from (204, 242) to (130, 136) then Draws a purple rectangle at (161, 14) with width 26 and height 38.
; PLAN: r0=178(x), r1=55(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=204(x1), r6=242(y1), r7=130(x2), r8=136(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=161(x), r11=14(y), r12=26(width), r13=38(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 178
LDI r1, 55
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 204
LDI r6, 242
LDI r7, 130
LDI r8, 136
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 161
LDI r11, 14
LDI r12, 26
LDI r13, 38
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
