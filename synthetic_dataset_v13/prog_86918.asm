; DESCRIPTION: Composite: Renders a orange box of size 118x83 starting at (22, 139) then Draws a green line from (207, 219) to (8, 96) then Creates a magenta circular shape at (241, 205) with radius 45.
; PLAN: r0=22(x), r1=139(y), r2=118(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=207(x1), r6=219(y1), r7=8(x2), r8=96(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=241(x), r11=205(y), r12=45(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 22
LDI r1, 139
LDI r2, 118
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 219
LDI r7, 8
LDI r8, 96
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 241
LDI r11, 205
LDI r12, 45
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
