; DESCRIPTION: Composite: Places a yellow dot at position (104, 73) then Draws a yellow rectangle at (364, 121) with width 93 and height 119 then Draws a cyan line from (451, 246) to (78, 26).
; PLAN: r0=104(x), r1=73(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=364(x), r6=121(y), r7=93(width), r8=119(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=451(x1), r11=246(y1), r12=78(x2), r13=26(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 104
LDI r1, 73
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 364
LDI r6, 121
LDI r7, 93
LDI r8, 119
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 451
LDI r11, 246
LDI r12, 78
LDI r13, 26
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
