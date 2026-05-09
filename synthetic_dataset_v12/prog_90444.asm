; DESCRIPTION: Composite: Renders a green disk with center (174, 81) and radius 71 then Draws a blue rectangle at (80, 22) with width 62 and height 113 then Places a cyan line segment connecting (29, 84) to (160, 165).
; PLAN: r0=174(x), r1=81(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=80(x), r6=22(y), r7=62(width), r8=113(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=29(x1), r11=84(y1), r12=160(x2), r13=165(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 174
LDI r1, 81
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 80
LDI r6, 22
LDI r7, 62
LDI r8, 113
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 29
LDI r11, 84
LDI r12, 160
LDI r13, 165
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
