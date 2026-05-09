; DESCRIPTION: Composite: Draws a purple circle centered at (116, 36) with radius 34 then Draws a orange line from (107, 106) to (255, 52) then Renders a white box of size 57x94 starting at (274, 70).
; PLAN: r0=116(x), r1=36(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=107(x1), r6=106(y1), r7=255(x2), r8=52(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=274(x), r11=70(y), r12=57(width), r13=94(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 116
LDI r1, 36
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 107
LDI r6, 106
LDI r7, 255
LDI r8, 52
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 274
LDI r11, 70
LDI r12, 57
LDI r13, 94
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
