; DESCRIPTION: Composite: Places a orange line segment connecting (252, 122) to (343, 86) then Renders a magenta box of size 110x93 starting at (209, 148) then Renders a purple disk with center (146, 126) and radius 23.
; PLAN: r0=252(x1), r1=122(y1), r2=343(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=209(x), r6=148(y), r7=110(width), r8=93(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=146(x), r11=126(y), r12=23(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 252
LDI r1, 122
LDI r2, 343
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 148
LDI r7, 110
LDI r8, 93
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 146
LDI r11, 126
LDI r12, 23
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
