; DESCRIPTION: Composite: Places a white dot at position (107, 237) then Places a red line segment connecting (364, 246) to (241, 56) then Draws a cyan rectangle at (369, 121) with width 17 and height 31.
; PLAN: r0=107(x), r1=237(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=364(x1), r6=246(y1), r7=241(x2), r8=56(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=369(x), r11=121(y), r12=17(width), r13=31(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 107
LDI r1, 237
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 364
LDI r6, 246
LDI r7, 241
LDI r8, 56
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 369
LDI r11, 121
LDI r12, 17
LDI r13, 31
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
