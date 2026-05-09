; DESCRIPTION: Composite: Renders a white line between points (369, 162) and (485, 16) then Draws a orange rectangle at (68, 66) with width 22 and height 90 then Renders a orange disk with center (407, 134) and radius 53.
; PLAN: r0=369(x1), r1=162(y1), r2=485(x2), r3=16(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=68(x), r6=66(y), r7=22(width), r8=90(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=407(x), r11=134(y), r12=53(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 369
LDI r1, 162
LDI r2, 485
LDI r3, 16
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 66
LDI r7, 22
LDI r8, 90
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 407
LDI r11, 134
LDI r12, 53
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
