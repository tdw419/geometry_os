; DESCRIPTION: Composite: Draws a red rectangle at (204, 106) with width 108 and height 13 then Sets a single magenta pixel at (443, 129) then Draws a purple line from (15, 230) to (319, 206).
; PLAN: r0=204(x), r1=106(y), r2=108(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=443(x), r6=129(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=15(x1), r11=230(y1), r12=319(x2), r13=206(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 204
LDI r1, 106
LDI r2, 108
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 443
LDI r6, 129
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 15
LDI r11, 230
LDI r12, 319
LDI r13, 206
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
