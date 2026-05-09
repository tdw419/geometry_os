; DESCRIPTION: Composite: Draws a green rectangle at (348, 70) with width 55 and height 75 then Places a red circle of radius 69 at center (331, 87) then Draws a red line from (354, 144) to (67, 187).
; PLAN: r0=348(x), r1=70(y), r2=55(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=331(x), r6=87(y), r7=69(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=354(x1), r11=144(y1), r12=67(x2), r13=187(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 348
LDI r1, 70
LDI r2, 55
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 331
LDI r6, 87
LDI r7, 69
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 354
LDI r11, 144
LDI r12, 67
LDI r13, 187
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
