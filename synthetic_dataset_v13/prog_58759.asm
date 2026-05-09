; DESCRIPTION: Composite: Places a red 47x18 rectangle at position (131, 185) then Places a orange line segment connecting (236, 178) to (340, 12) then Creates a magenta circular shape at (287, 146) with radius 22.
; PLAN: r0=131(x), r1=185(y), r2=47(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=236(x1), r6=178(y1), r7=340(x2), r8=12(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=287(x), r11=146(y), r12=22(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 131
LDI r1, 185
LDI r2, 47
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 178
LDI r7, 340
LDI r8, 12
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 287
LDI r11, 146
LDI r12, 22
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
