; DESCRIPTION: Composite: Draws a red line from (432, 170) to (358, 228) then Places a magenta 40x33 rectangle at position (237, 123) then Draws a yellow circle centered at (171, 241) with radius 14.
; PLAN: r0=432(x1), r1=170(y1), r2=358(x2), r3=228(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=237(x), r6=123(y), r7=40(width), r8=33(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=171(x), r11=241(y), r12=14(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 432
LDI r1, 170
LDI r2, 358
LDI r3, 228
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 123
LDI r7, 40
LDI r8, 33
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 171
LDI r11, 241
LDI r12, 14
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
