; DESCRIPTION: Composite: Sets a single orange pixel at (70, 20) then Places a red line segment connecting (143, 92) to (173, 118) then Draws a blue rectangle at (315, 100) with width 116 and height 74.
; PLAN: r0=70(x), r1=20(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=143(x1), r6=92(y1), r7=173(x2), r8=118(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=315(x), r11=100(y), r12=116(width), r13=74(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 70
LDI r1, 20
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 143
LDI r6, 92
LDI r7, 173
LDI r8, 118
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 315
LDI r11, 100
LDI r12, 116
LDI r13, 74
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
