; DESCRIPTION: Composite: Creates a red circular shape at (312, 54) with radius 43 then Sets a single red pixel at (153, 234) then Renders a orange box of size 118x84 starting at (37, 165).
; PLAN: r0=312(x), r1=54(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=153(x), r6=234(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=37(x), r11=165(y), r12=118(width), r13=84(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 312
LDI r1, 54
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 153
LDI r6, 234
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 37
LDI r11, 165
LDI r12, 118
LDI r13, 84
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
