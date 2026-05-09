; DESCRIPTION: Composite: Renders a white line between points (4, 230) and (17, 39) then Draws a purple rectangle at (371, 79) with width 81 and height 62 then Creates a white circular shape at (346, 76) with radius 41.
; PLAN: r0=4(x1), r1=230(y1), r2=17(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=371(x), r6=79(y), r7=81(width), r8=62(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=346(x), r11=76(y), r12=41(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 4
LDI r1, 230
LDI r2, 17
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 79
LDI r7, 81
LDI r8, 62
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 346
LDI r11, 76
LDI r12, 41
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
