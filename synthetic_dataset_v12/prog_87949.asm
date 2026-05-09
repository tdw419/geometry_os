; DESCRIPTION: Composite: Draws a yellow line from (25, 39) to (287, 236) then Draws a orange rectangle at (261, 127) with width 51 and height 37 then Creates a black circular shape at (193, 142) with radius 68.
; PLAN: r0=25(x1), r1=39(y1), r2=287(x2), r3=236(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=261(x), r6=127(y), r7=51(width), r8=37(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=193(x), r11=142(y), r12=68(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 25
LDI r1, 39
LDI r2, 287
LDI r3, 236
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 127
LDI r7, 51
LDI r8, 37
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 193
LDI r11, 142
LDI r12, 68
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
