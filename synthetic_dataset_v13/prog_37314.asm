; DESCRIPTION: Composite: Draws a purple circle centered at (317, 116) with radius 75 then Draws a white line from (477, 233) to (404, 185) then Draws a blue rectangle at (128, 82) with width 41 and height 43.
; PLAN: r0=317(x), r1=116(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=477(x1), r6=233(y1), r7=404(x2), r8=185(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=128(x), r11=82(y), r12=41(width), r13=43(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 317
LDI r1, 116
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 477
LDI r6, 233
LDI r7, 404
LDI r8, 185
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 128
LDI r11, 82
LDI r12, 41
LDI r13, 43
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
