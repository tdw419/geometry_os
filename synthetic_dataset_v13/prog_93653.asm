; DESCRIPTION: Composite: Draws a blue rectangle at (125, 176) with width 95 and height 28 then Draws a white line from (74, 119) to (323, 122) then Sets a single black pixel at (476, 221).
; PLAN: r0=125(x), r1=176(y), r2=95(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=74(x1), r6=119(y1), r7=323(x2), r8=122(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=476(x), r11=221(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 125
LDI r1, 176
LDI r2, 95
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 119
LDI r7, 323
LDI r8, 122
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 476
LDI r11, 221
LDI r12, 0x000000
PSET r10, r11, r12
HALT
