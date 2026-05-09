; DESCRIPTION: Composite: Draws a cyan line from (454, 112) to (482, 120) then Creates a white rectangular region at (157, 147) spanning 54 by 42 pixels then Places a purple circle of radius 26 at center (276, 116).
; PLAN: r0=454(x1), r1=112(y1), r2=482(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=157(x), r6=147(y), r7=54(width), r8=42(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=276(x), r11=116(y), r12=26(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 454
LDI r1, 112
LDI r2, 482
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 147
LDI r7, 54
LDI r8, 42
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 276
LDI r11, 116
LDI r12, 26
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
