; DESCRIPTION: Composite: Draws a white circle centered at (381, 120) with radius 77 then Places a orange line segment connecting (270, 20) to (366, 197) then Creates a green rectangular region at (39, 190) spanning 41 by 56 pixels.
; PLAN: r0=381(x), r1=120(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=270(x1), r6=20(y1), r7=366(x2), r8=197(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=39(x), r11=190(y), r12=41(width), r13=56(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 381
LDI r1, 120
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 270
LDI r6, 20
LDI r7, 366
LDI r8, 197
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 39
LDI r11, 190
LDI r12, 41
LDI r13, 56
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
