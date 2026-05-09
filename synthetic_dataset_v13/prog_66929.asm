; DESCRIPTION: Composite: Places a orange dot at position (469, 30) then Places a blue line segment connecting (360, 176) to (19, 197) then Draws a orange rectangle at (59, 165) with width 95 and height 87.
; PLAN: r0=469(x), r1=30(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=360(x1), r6=176(y1), r7=19(x2), r8=197(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=59(x), r11=165(y), r12=95(width), r13=87(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 469
LDI r1, 30
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 360
LDI r6, 176
LDI r7, 19
LDI r8, 197
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 59
LDI r11, 165
LDI r12, 95
LDI r13, 87
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
