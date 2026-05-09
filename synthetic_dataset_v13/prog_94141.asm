; DESCRIPTION: Composite: Places a blue 90x54 rectangle at position (217, 62) then Renders a white line between points (348, 78) and (492, 223) then Places a purple circle of radius 15 at center (416, 19).
; PLAN: r0=217(x), r1=62(y), r2=90(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=348(x1), r6=78(y1), r7=492(x2), r8=223(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=416(x), r11=19(y), r12=15(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 217
LDI r1, 62
LDI r2, 90
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 78
LDI r7, 492
LDI r8, 223
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 416
LDI r11, 19
LDI r12, 15
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
