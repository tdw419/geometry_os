; DESCRIPTION: Composite: Draws a blue rectangle at (168, 14) with width 55 and height 47 then Renders a blue line between points (219, 138) and (135, 170) then Renders a black disk with center (274, 126) and radius 74.
; PLAN: r0=168(x), r1=14(y), r2=55(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=219(x1), r6=138(y1), r7=135(x2), r8=170(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=274(x), r11=126(y), r12=74(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 168
LDI r1, 14
LDI r2, 55
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 138
LDI r7, 135
LDI r8, 170
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 274
LDI r11, 126
LDI r12, 74
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
