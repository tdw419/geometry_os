; DESCRIPTION: Composite: Sets a single magenta pixel at (383, 203) then Places a orange line segment connecting (276, 7) to (228, 36) then Draws a purple rectangle at (271, 5) with width 95 and height 12.
; PLAN: r0=383(x), r1=203(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=276(x1), r6=7(y1), r7=228(x2), r8=36(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=271(x), r11=5(y), r12=95(width), r13=12(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 383
LDI r1, 203
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 276
LDI r6, 7
LDI r7, 228
LDI r8, 36
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 271
LDI r11, 5
LDI r12, 95
LDI r13, 12
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
