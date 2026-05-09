; DESCRIPTION: Composite: Creates a magenta circular shape at (27, 19) with radius 13 then Creates a orange rectangular region at (46, 38) spanning 13 by 43 pixels then Draws a white line from (122, 255) to (28, 205).
; PLAN: r0=27(x), r1=19(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=46(x), r6=38(y), r7=13(width), r8=43(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=122(x1), r11=255(y1), r12=28(x2), r13=205(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 27
LDI r1, 19
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 46
LDI r6, 38
LDI r7, 13
LDI r8, 43
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 122
LDI r11, 255
LDI r12, 28
LDI r13, 205
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
