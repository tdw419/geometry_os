; DESCRIPTION: Composite: Renders a blue disk with center (160, 102) and radius 67 then Draws a green rectangle at (96, 4) with width 103 and height 118 then Renders a blue line between points (479, 116) and (319, 200).
; PLAN: r0=160(x), r1=102(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=96(x), r6=4(y), r7=103(width), r8=118(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=479(x1), r11=116(y1), r12=319(x2), r13=200(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 160
LDI r1, 102
LDI r2, 67
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 96
LDI r6, 4
LDI r7, 103
LDI r8, 118
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 479
LDI r11, 116
LDI r12, 319
LDI r13, 200
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
