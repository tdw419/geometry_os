; DESCRIPTION: Composite: Renders a red line between points (475, 173) and (479, 219) then Creates a red circular shape at (65, 71) with radius 36 then Draws a black rectangle at (11, 41) with width 78 and height 77.
; PLAN: r0=475(x1), r1=173(y1), r2=479(x2), r3=219(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=65(x), r6=71(y), r7=36(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=11(x), r11=41(y), r12=78(width), r13=77(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 475
LDI r1, 173
LDI r2, 479
LDI r3, 219
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 71
LDI r7, 36
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 11
LDI r11, 41
LDI r12, 78
LDI r13, 77
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
