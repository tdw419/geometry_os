; DESCRIPTION: Composite: Draws a red circle centered at (255, 76) with radius 62 then Draws a blue rectangle at (424, 70) with width 11 and height 85 then Places a green line segment connecting (466, 253) to (320, 82).
; PLAN: r0=255(x), r1=76(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=424(x), r6=70(y), r7=11(width), r8=85(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=466(x1), r11=253(y1), r12=320(x2), r13=82(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 255
LDI r1, 76
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 424
LDI r6, 70
LDI r7, 11
LDI r8, 85
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 466
LDI r11, 253
LDI r12, 320
LDI r13, 82
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
