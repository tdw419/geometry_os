; DESCRIPTION: Composite: Renders a red line between points (432, 100) and (432, 38) then Sets a single black pixel at (253, 14) then Draws a cyan rectangle at (362, 50) with width 23 and height 74.
; PLAN: r0=432(x1), r1=100(y1), r2=432(x2), r3=38(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=253(x), r6=14(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=362(x), r11=50(y), r12=23(width), r13=74(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 432
LDI r1, 100
LDI r2, 432
LDI r3, 38
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 14
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 362
LDI r11, 50
LDI r12, 23
LDI r13, 74
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
