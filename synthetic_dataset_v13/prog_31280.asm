; DESCRIPTION: Composite: Places a red 57x103 rectangle at position (272, 105) then Places a purple line segment connecting (159, 188) to (455, 46) then Creates a orange circular shape at (177, 151) with radius 24.
; PLAN: r0=272(x), r1=105(y), r2=57(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=159(x1), r6=188(y1), r7=455(x2), r8=46(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=177(x), r11=151(y), r12=24(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 272
LDI r1, 105
LDI r2, 57
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 188
LDI r7, 455
LDI r8, 46
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 177
LDI r11, 151
LDI r12, 24
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
