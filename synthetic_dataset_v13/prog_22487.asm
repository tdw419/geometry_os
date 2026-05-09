; DESCRIPTION: Composite: Creates a magenta circular shape at (399, 126) with radius 76 then Renders a orange line between points (88, 201) and (63, 145) then Draws a cyan rectangle at (230, 70) with width 92 and height 62.
; PLAN: r0=399(x), r1=126(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=88(x1), r6=201(y1), r7=63(x2), r8=145(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=230(x), r11=70(y), r12=92(width), r13=62(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 399
LDI r1, 126
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 88
LDI r6, 201
LDI r7, 63
LDI r8, 145
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 230
LDI r11, 70
LDI r12, 92
LDI r13, 62
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
