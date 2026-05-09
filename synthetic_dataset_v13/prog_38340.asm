; DESCRIPTION: Composite: Draws a red rectangle at (374, 9) with width 85 and height 65 then Renders a cyan disk with center (368, 108) and radius 76 then Places a blue line segment connecting (232, 123) to (149, 166).
; PLAN: r0=374(x), r1=9(y), r2=85(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=368(x), r6=108(y), r7=76(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=232(x1), r11=123(y1), r12=149(x2), r13=166(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 374
LDI r1, 9
LDI r2, 85
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 108
LDI r7, 76
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 232
LDI r11, 123
LDI r12, 149
LDI r13, 166
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
