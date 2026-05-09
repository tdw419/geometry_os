; DESCRIPTION: Composite: Places a green dot at position (143, 171) then Draws a purple line from (65, 190) to (188, 238) then Draws a white rectangle at (353, 133) with width 41 and height 118.
; PLAN: r0=143(x), r1=171(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=65(x1), r6=190(y1), r7=188(x2), r8=238(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=353(x), r11=133(y), r12=41(width), r13=118(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 143
LDI r1, 171
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 65
LDI r6, 190
LDI r7, 188
LDI r8, 238
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 353
LDI r11, 133
LDI r12, 41
LDI r13, 118
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
