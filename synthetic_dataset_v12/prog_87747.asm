; DESCRIPTION: Composite: Sets a single orange pixel at (382, 183) then Draws a red line from (504, 156) to (101, 249) then Draws a black rectangle at (323, 50) with width 29 and height 29.
; PLAN: r0=382(x), r1=183(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=504(x1), r6=156(y1), r7=101(x2), r8=249(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=323(x), r11=50(y), r12=29(width), r13=29(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 382
LDI r1, 183
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 504
LDI r6, 156
LDI r7, 101
LDI r8, 249
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 323
LDI r11, 50
LDI r12, 29
LDI r13, 29
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
