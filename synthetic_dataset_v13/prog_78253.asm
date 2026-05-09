; DESCRIPTION: Composite: Draws a orange line from (175, 56) to (324, 54) then Creates a purple rectangular region at (294, 216) spanning 39 by 24 pixels then Places a magenta circle of radius 18 at center (68, 19).
; PLAN: r0=175(x1), r1=56(y1), r2=324(x2), r3=54(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=294(x), r6=216(y), r7=39(width), r8=24(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=68(x), r11=19(y), r12=18(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 175
LDI r1, 56
LDI r2, 324
LDI r3, 54
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 216
LDI r7, 39
LDI r8, 24
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 68
LDI r11, 19
LDI r12, 18
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
