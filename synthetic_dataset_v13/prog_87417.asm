; DESCRIPTION: Composite: Draws a yellow rectangle at (401, 150) with width 59 and height 88 then Draws a orange circle centered at (75, 104) with radius 68 then Renders a blue line between points (398, 24) and (483, 51).
; PLAN: r0=401(x), r1=150(y), r2=59(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=75(x), r6=104(y), r7=68(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=398(x1), r11=24(y1), r12=483(x2), r13=51(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 401
LDI r1, 150
LDI r2, 59
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 104
LDI r7, 68
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 398
LDI r11, 24
LDI r12, 483
LDI r13, 51
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
