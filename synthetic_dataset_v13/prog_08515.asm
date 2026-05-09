; DESCRIPTION: Composite: Sets a single red pixel at (456, 50) then Draws a purple line from (4, 104) to (86, 43) then Draws a purple rectangle at (426, 122) with width 68 and height 103.
; PLAN: r0=456(x), r1=50(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=4(x1), r6=104(y1), r7=86(x2), r8=43(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=426(x), r11=122(y), r12=68(width), r13=103(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 456
LDI r1, 50
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 4
LDI r6, 104
LDI r7, 86
LDI r8, 43
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 426
LDI r11, 122
LDI r12, 68
LDI r13, 103
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
