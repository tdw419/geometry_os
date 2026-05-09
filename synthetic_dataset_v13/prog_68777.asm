; DESCRIPTION: Composite: Renders a magenta disk with center (144, 162) and radius 33 then Renders a red line between points (89, 4) and (121, 80) then Draws a purple rectangle at (230, 47) with width 17 and height 117.
; PLAN: r0=144(x), r1=162(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=89(x1), r6=4(y1), r7=121(x2), r8=80(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=230(x), r11=47(y), r12=17(width), r13=117(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 144
LDI r1, 162
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 89
LDI r6, 4
LDI r7, 121
LDI r8, 80
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 230
LDI r11, 47
LDI r12, 17
LDI r13, 117
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
