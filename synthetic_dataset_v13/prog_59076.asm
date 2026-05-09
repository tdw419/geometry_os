; DESCRIPTION: Composite: Draws a cyan rectangle at (135, 35) with width 29 and height 14 then Places a red dot at position (118, 83) then Draws a orange line from (315, 143) to (274, 90).
; PLAN: r0=135(x), r1=35(y), r2=29(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=118(x), r6=83(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=315(x1), r11=143(y1), r12=274(x2), r13=90(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 135
LDI r1, 35
LDI r2, 29
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 83
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 315
LDI r11, 143
LDI r12, 274
LDI r13, 90
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
