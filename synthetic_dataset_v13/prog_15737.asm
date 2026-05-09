; DESCRIPTION: Composite: Draws a red circle centered at (451, 55) with radius 36 then Draws a red rectangle at (65, 79) with width 95 and height 16 then Renders a blue line between points (184, 18) and (87, 143).
; PLAN: r0=451(x), r1=55(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=65(x), r6=79(y), r7=95(width), r8=16(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=184(x1), r11=18(y1), r12=87(x2), r13=143(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 451
LDI r1, 55
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 65
LDI r6, 79
LDI r7, 95
LDI r8, 16
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 184
LDI r11, 18
LDI r12, 87
LDI r13, 143
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
