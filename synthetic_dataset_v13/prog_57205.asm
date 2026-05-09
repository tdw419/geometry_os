; DESCRIPTION: Composite: Places a yellow circle of radius 76 at center (432, 147) then Creates a blue rectangular region at (316, 122) spanning 19 by 35 pixels.
; PLAN: r0=432(x), r1=147(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=316(x), r6=122(y), r7=19(width), r8=35(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 432
LDI r1, 147
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 316
LDI r6, 122
LDI r7, 19
LDI r8, 35
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
