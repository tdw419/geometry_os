; DESCRIPTION: Composite: Draws a blue rectangle at (164, 44) with width 107 and height 106 then Renders a white disk with center (178, 172) and radius 74 then Draws a orange line from (471, 151) to (416, 253).
; PLAN: r0=164(x), r1=44(y), r2=107(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=178(x), r6=172(y), r7=74(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=471(x1), r11=151(y1), r12=416(x2), r13=253(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 164
LDI r1, 44
LDI r2, 107
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 172
LDI r7, 74
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 471
LDI r11, 151
LDI r12, 416
LDI r13, 253
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
