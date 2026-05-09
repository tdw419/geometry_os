; DESCRIPTION: Composite: Draws a orange rectangle at (362, 113) with width 108 and height 91 then Draws a green line from (381, 221) to (258, 244) then Creates a red circular shape at (355, 136) with radius 24.
; PLAN: r0=362(x), r1=113(y), r2=108(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=381(x1), r6=221(y1), r7=258(x2), r8=244(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=355(x), r11=136(y), r12=24(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 362
LDI r1, 113
LDI r2, 108
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 221
LDI r7, 258
LDI r8, 244
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 355
LDI r11, 136
LDI r12, 24
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
