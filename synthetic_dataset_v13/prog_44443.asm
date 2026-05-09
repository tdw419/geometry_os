; DESCRIPTION: Composite: Sets a single red pixel at (329, 241) then Draws a orange rectangle at (73, 104) with width 99 and height 101 then Draws a red line from (509, 115) to (122, 207).
; PLAN: r0=329(x), r1=241(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=73(x), r6=104(y), r7=99(width), r8=101(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=509(x1), r11=115(y1), r12=122(x2), r13=207(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 241
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 73
LDI r6, 104
LDI r7, 99
LDI r8, 101
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 509
LDI r11, 115
LDI r12, 122
LDI r13, 207
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
