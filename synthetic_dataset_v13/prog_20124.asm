; DESCRIPTION: Composite: Creates a green circular shape at (136, 84) with radius 53 then Places a yellow line segment connecting (344, 41) to (428, 219).
; PLAN: r0=136(x), r1=84(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=344(x1), r6=41(y1), r7=428(x2), r8=219(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 136
LDI r1, 84
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 344
LDI r6, 41
LDI r7, 428
LDI r8, 219
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
