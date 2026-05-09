; DESCRIPTION: Composite: Draws a white line from (245, 16) to (370, 128) then Draws a purple rectangle at (134, 101) with width 105 and height 97 then Creates a white circular shape at (358, 151) with radius 53.
; PLAN: r0=245(x1), r1=16(y1), r2=370(x2), r3=128(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=134(x), r6=101(y), r7=105(width), r8=97(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=358(x), r11=151(y), r12=53(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 245
LDI r1, 16
LDI r2, 370
LDI r3, 128
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 134
LDI r6, 101
LDI r7, 105
LDI r8, 97
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 358
LDI r11, 151
LDI r12, 53
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
