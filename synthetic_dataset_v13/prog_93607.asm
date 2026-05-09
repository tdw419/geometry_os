; DESCRIPTION: Composite: Draws a yellow line from (430, 106) to (466, 193) then Creates a red rectangular region at (291, 126) spanning 97 by 94 pixels then Creates a blue circular shape at (343, 196) with radius 48.
; PLAN: r0=430(x1), r1=106(y1), r2=466(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=291(x), r6=126(y), r7=97(width), r8=94(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=343(x), r11=196(y), r12=48(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 430
LDI r1, 106
LDI r2, 466
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 126
LDI r7, 97
LDI r8, 94
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 343
LDI r11, 196
LDI r12, 48
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
