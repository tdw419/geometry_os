; DESCRIPTION: Composite: Draws a cyan rectangle at (347, 136) with width 72 and height 114 then Places a orange dot at position (313, 248) then Draws a cyan line from (79, 35) to (66, 206).
; PLAN: r0=347(x), r1=136(y), r2=72(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=313(x), r6=248(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=79(x1), r11=35(y1), r12=66(x2), r13=206(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 136
LDI r2, 72
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 248
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 79
LDI r11, 35
LDI r12, 66
LDI r13, 206
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
