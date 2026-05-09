; DESCRIPTION: Composite: Creates a red rectangular region at (13, 117) spanning 67 by 102 pixels then Places a black circle of radius 42 at center (162, 65) then Draws a orange line from (269, 184) to (329, 6).
; PLAN: r0=13(x), r1=117(y), r2=67(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=162(x), r6=65(y), r7=42(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=269(x1), r11=184(y1), r12=329(x2), r13=6(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 13
LDI r1, 117
LDI r2, 67
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 65
LDI r7, 42
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 269
LDI r11, 184
LDI r12, 329
LDI r13, 6
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
