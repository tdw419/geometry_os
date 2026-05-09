; DESCRIPTION: Composite: Places a red line segment connecting (194, 97) to (285, 135) then Draws a red rectangle at (355, 5) with width 90 and height 15 then Sets a single purple pixel at (47, 219).
; PLAN: r0=194(x1), r1=97(y1), r2=285(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=355(x), r6=5(y), r7=90(width), r8=15(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=47(x), r11=219(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 194
LDI r1, 97
LDI r2, 285
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 5
LDI r7, 90
LDI r8, 15
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 47
LDI r11, 219
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
