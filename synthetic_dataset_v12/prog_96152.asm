; DESCRIPTION: Composite: Draws a purple rectangle at (327, 37) with width 21 and height 99 then Draws a red line from (432, 232) to (315, 6) then Renders a red disk with center (354, 107) and radius 60.
; PLAN: r0=327(x), r1=37(y), r2=21(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=432(x1), r6=232(y1), r7=315(x2), r8=6(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=354(x), r11=107(y), r12=60(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 327
LDI r1, 37
LDI r2, 21
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 232
LDI r7, 315
LDI r8, 6
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 354
LDI r11, 107
LDI r12, 60
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
