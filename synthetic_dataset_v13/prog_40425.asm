; DESCRIPTION: Composite: Sets a single yellow pixel at (113, 237) then Draws a purple line from (309, 14) to (67, 92) then Draws a magenta rectangle at (74, 78) with width 62 and height 87.
; PLAN: r0=113(x), r1=237(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=309(x1), r6=14(y1), r7=67(x2), r8=92(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=74(x), r11=78(y), r12=62(width), r13=87(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 113
LDI r1, 237
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 309
LDI r6, 14
LDI r7, 67
LDI r8, 92
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 74
LDI r11, 78
LDI r12, 62
LDI r13, 87
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
