; DESCRIPTION: Composite: Draws a red rectangle at (174, 42) with width 41 and height 96 then Places a black line segment connecting (271, 216) to (211, 88) then Draws a orange circle centered at (202, 87) with radius 78.
; PLAN: r0=174(x), r1=42(y), r2=41(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=271(x1), r6=216(y1), r7=211(x2), r8=88(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=202(x), r11=87(y), r12=78(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 174
LDI r1, 42
LDI r2, 41
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 216
LDI r7, 211
LDI r8, 88
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 202
LDI r11, 87
LDI r12, 78
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
