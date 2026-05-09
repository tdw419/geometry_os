; DESCRIPTION: Composite: Renders a red box of size 43x90 starting at (86, 134) then Renders a magenta line between points (276, 55) and (197, 234) then Creates a green circular shape at (311, 77) with radius 67.
; PLAN: r0=86(x), r1=134(y), r2=43(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=276(x1), r6=55(y1), r7=197(x2), r8=234(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=311(x), r11=77(y), r12=67(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 86
LDI r1, 134
LDI r2, 43
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 55
LDI r7, 197
LDI r8, 234
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 311
LDI r11, 77
LDI r12, 67
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
