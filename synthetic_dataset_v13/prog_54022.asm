; DESCRIPTION: Composite: Draws a cyan circle centered at (311, 201) with radius 37 then Draws a magenta rectangle at (393, 157) with width 27 and height 61 then Draws a orange line from (379, 115) to (505, 134).
; PLAN: r0=311(x), r1=201(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=393(x), r6=157(y), r7=27(width), r8=61(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=379(x1), r11=115(y1), r12=505(x2), r13=134(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 311
LDI r1, 201
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 393
LDI r6, 157
LDI r7, 27
LDI r8, 61
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 379
LDI r11, 115
LDI r12, 505
LDI r13, 134
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
