; DESCRIPTION: Composite: Draws a magenta line from (344, 253) to (413, 148) then Renders a black box of size 105x58 starting at (259, 8) then Renders a orange disk with center (69, 37) and radius 23.
; PLAN: r0=344(x1), r1=253(y1), r2=413(x2), r3=148(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=259(x), r6=8(y), r7=105(width), r8=58(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=69(x), r11=37(y), r12=23(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 344
LDI r1, 253
LDI r2, 413
LDI r3, 148
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 8
LDI r7, 105
LDI r8, 58
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 69
LDI r11, 37
LDI r12, 23
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
