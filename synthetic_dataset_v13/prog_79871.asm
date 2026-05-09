; DESCRIPTION: Composite: Draws a yellow rectangle at (282, 176) with width 94 and height 46 then Draws a red line from (232, 79) to (380, 49).
; PLAN: r0=282(x), r1=176(y), r2=94(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=232(x1), r6=79(y1), r7=380(x2), r8=49(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 282
LDI r1, 176
LDI r2, 94
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 79
LDI r7, 380
LDI r8, 49
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
