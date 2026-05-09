; DESCRIPTION: Composite: Renders a cyan line between points (233, 75) and (398, 155) then Draws a magenta rectangle at (20, 75) with width 67 and height 84 then Renders a white disk with center (169, 226) and radius 17.
; PLAN: r0=233(x1), r1=75(y1), r2=398(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=20(x), r6=75(y), r7=67(width), r8=84(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=169(x), r11=226(y), r12=17(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 233
LDI r1, 75
LDI r2, 398
LDI r3, 155
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 75
LDI r7, 67
LDI r8, 84
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 169
LDI r11, 226
LDI r12, 17
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
