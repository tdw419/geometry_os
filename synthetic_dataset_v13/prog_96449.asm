; DESCRIPTION: Composite: Places a orange line segment connecting (399, 201) to (74, 74) then Places a blue 104x80 rectangle at position (245, 88) then Creates a red circular shape at (190, 57) with radius 43.
; PLAN: r0=399(x1), r1=201(y1), r2=74(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=245(x), r6=88(y), r7=104(width), r8=80(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=190(x), r11=57(y), r12=43(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 399
LDI r1, 201
LDI r2, 74
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 88
LDI r7, 104
LDI r8, 80
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 190
LDI r11, 57
LDI r12, 43
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
