; DESCRIPTION: Composite: Sets a single red pixel at (381, 216) then Draws a green rectangle at (171, 75) with width 83 and height 74 then Draws a orange line from (372, 166) to (278, 238).
; PLAN: r0=381(x), r1=216(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=171(x), r6=75(y), r7=83(width), r8=74(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=372(x1), r11=166(y1), r12=278(x2), r13=238(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 381
LDI r1, 216
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 171
LDI r6, 75
LDI r7, 83
LDI r8, 74
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 372
LDI r11, 166
LDI r12, 278
LDI r13, 238
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
