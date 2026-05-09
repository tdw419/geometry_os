; DESCRIPTION: Composite: Renders a green line between points (416, 134) and (294, 62) then Renders a cyan box of size 74x53 starting at (253, 71) then Creates a orange circular shape at (158, 123) with radius 29.
; PLAN: r0=416(x1), r1=134(y1), r2=294(x2), r3=62(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=253(x), r6=71(y), r7=74(width), r8=53(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=158(x), r11=123(y), r12=29(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 416
LDI r1, 134
LDI r2, 294
LDI r3, 62
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 71
LDI r7, 74
LDI r8, 53
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 158
LDI r11, 123
LDI r12, 29
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
