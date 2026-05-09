; DESCRIPTION: Composite: Sets a single red pixel at (348, 74) then Draws a red line from (488, 255) to (485, 161) then Draws a black rectangle at (392, 109) with width 92 and height 26.
; PLAN: r0=348(x), r1=74(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=488(x1), r6=255(y1), r7=485(x2), r8=161(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=392(x), r11=109(y), r12=92(width), r13=26(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 348
LDI r1, 74
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 488
LDI r6, 255
LDI r7, 485
LDI r8, 161
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 392
LDI r11, 109
LDI r12, 92
LDI r13, 26
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
