; DESCRIPTION: Composite: Places a blue circle of radius 15 at center (288, 138) then Renders a yellow line between points (68, 37) and (511, 243) then Draws a green rectangle at (303, 131) with width 11 and height 36.
; PLAN: r0=288(x), r1=138(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=68(x1), r6=37(y1), r7=511(x2), r8=243(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=303(x), r11=131(y), r12=11(width), r13=36(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 288
LDI r1, 138
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 68
LDI r6, 37
LDI r7, 511
LDI r8, 243
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 303
LDI r11, 131
LDI r12, 11
LDI r13, 36
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
