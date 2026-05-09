; DESCRIPTION: Composite: Draws a orange line from (286, 244) to (33, 33) then Places a red 105x72 rectangle at position (253, 133) then Draws a red circle centered at (146, 160) with radius 23.
; PLAN: r0=286(x1), r1=244(y1), r2=33(x2), r3=33(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=253(x), r6=133(y), r7=105(width), r8=72(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=146(x), r11=160(y), r12=23(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 286
LDI r1, 244
LDI r2, 33
LDI r3, 33
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 133
LDI r7, 105
LDI r8, 72
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 146
LDI r11, 160
LDI r12, 23
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
