; DESCRIPTION: Composite: Places a purple line segment connecting (399, 41) to (66, 47) then Renders a yellow box of size 77x19 starting at (42, 188) then Creates a orange circular shape at (168, 185) with radius 57.
; PLAN: r0=399(x1), r1=41(y1), r2=66(x2), r3=47(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=42(x), r6=188(y), r7=77(width), r8=19(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=168(x), r11=185(y), r12=57(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 399
LDI r1, 41
LDI r2, 66
LDI r3, 47
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 42
LDI r6, 188
LDI r7, 77
LDI r8, 19
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 168
LDI r11, 185
LDI r12, 57
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
