; DESCRIPTION: Composite: Places a white dot at position (465, 206) then Draws a purple line from (116, 55) to (210, 90) then Draws a blue rectangle at (170, 11) with width 38 and height 34.
; PLAN: r0=465(x), r1=206(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=116(x1), r6=55(y1), r7=210(x2), r8=90(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=170(x), r11=11(y), r12=38(width), r13=34(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 465
LDI r1, 206
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 116
LDI r6, 55
LDI r7, 210
LDI r8, 90
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 170
LDI r11, 11
LDI r12, 38
LDI r13, 34
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
