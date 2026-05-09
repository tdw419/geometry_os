; DESCRIPTION: Composite: Draws a green rectangle at (16, 74) with width 39 and height 52 then Creates a black circular shape at (380, 176) with radius 50 then Renders a orange line between points (167, 247) and (191, 145).
; PLAN: r0=16(x), r1=74(y), r2=39(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=380(x), r6=176(y), r7=50(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=167(x1), r11=247(y1), r12=191(x2), r13=145(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 16
LDI r1, 74
LDI r2, 39
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 176
LDI r7, 50
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 167
LDI r11, 247
LDI r12, 191
LDI r13, 145
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
