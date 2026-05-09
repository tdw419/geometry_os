; DESCRIPTION: Composite: Draws a black line from (357, 57) to (0, 110) then Places a blue circle of radius 60 at center (83, 140) then Draws a orange rectangle at (358, 45) with width 57 and height 37.
; PLAN: r0=357(x1), r1=57(y1), r2=0(x2), r3=110(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=83(x), r6=140(y), r7=60(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=358(x), r11=45(y), r12=57(width), r13=37(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 357
LDI r1, 57
LDI r2, 0
LDI r3, 110
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 140
LDI r7, 60
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 358
LDI r11, 45
LDI r12, 57
LDI r13, 37
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
