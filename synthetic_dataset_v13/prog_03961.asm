; DESCRIPTION: Composite: Draws a magenta line from (253, 98) to (324, 33) then Draws a orange rectangle at (103, 85) with width 49 and height 82 then Creates a yellow circular shape at (344, 180) with radius 56.
; PLAN: r0=253(x1), r1=98(y1), r2=324(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=85(y), r7=49(width), r8=82(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=344(x), r11=180(y), r12=56(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 253
LDI r1, 98
LDI r2, 324
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 85
LDI r7, 49
LDI r8, 82
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 344
LDI r11, 180
LDI r12, 56
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
