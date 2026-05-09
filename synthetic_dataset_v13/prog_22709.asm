; DESCRIPTION: Composite: Draws a orange rectangle at (283, 94) with width 40 and height 98 then Sets a single red pixel at (400, 94) then Creates a black circular shape at (230, 67) with radius 60.
; PLAN: r0=283(x), r1=94(y), r2=40(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x), r6=94(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=230(x), r11=67(y), r12=60(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 283
LDI r1, 94
LDI r2, 40
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 94
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 230
LDI r11, 67
LDI r12, 60
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
