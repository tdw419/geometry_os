; DESCRIPTION: Composite: Sets a single orange pixel at (148, 142) then Places a red line segment connecting (338, 206) to (390, 8) then Draws a cyan rectangle at (171, 36) with width 27 and height 67.
; PLAN: r0=148(x), r1=142(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=338(x1), r6=206(y1), r7=390(x2), r8=8(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=171(x), r11=36(y), r12=27(width), r13=67(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 148
LDI r1, 142
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 338
LDI r6, 206
LDI r7, 390
LDI r8, 8
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 171
LDI r11, 36
LDI r12, 27
LDI r13, 67
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
