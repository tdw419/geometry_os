; DESCRIPTION: Composite: Draws a black circle centered at (205, 93) with radius 77 then Draws a red line from (312, 25) to (283, 99) then Draws a red rectangle at (327, 159) with width 41 and height 20.
; PLAN: r0=205(x), r1=93(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=312(x1), r6=25(y1), r7=283(x2), r8=99(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=327(x), r11=159(y), r12=41(width), r13=20(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 205
LDI r1, 93
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 312
LDI r6, 25
LDI r7, 283
LDI r8, 99
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 327
LDI r11, 159
LDI r12, 41
LDI r13, 20
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
