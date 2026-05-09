; DESCRIPTION: Composite: Draws a green line from (461, 77) to (253, 67) then Draws a yellow rectangle at (334, 148) with width 44 and height 42 then Creates a magenta circular shape at (324, 165) with radius 12.
; PLAN: r0=461(x1), r1=77(y1), r2=253(x2), r3=67(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=334(x), r6=148(y), r7=44(width), r8=42(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=324(x), r11=165(y), r12=12(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 461
LDI r1, 77
LDI r2, 253
LDI r3, 67
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 334
LDI r6, 148
LDI r7, 44
LDI r8, 42
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 324
LDI r11, 165
LDI r12, 12
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
