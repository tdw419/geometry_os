; DESCRIPTION: Composite: Places a magenta line segment connecting (398, 253) to (167, 100) then Places a magenta 114x35 rectangle at position (245, 78) then Places a green circle of radius 74 at center (74, 105).
; PLAN: r0=398(x1), r1=253(y1), r2=167(x2), r3=100(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=245(x), r6=78(y), r7=114(width), r8=35(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=74(x), r11=105(y), r12=74(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 398
LDI r1, 253
LDI r2, 167
LDI r3, 100
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 78
LDI r7, 114
LDI r8, 35
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 74
LDI r11, 105
LDI r12, 74
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
