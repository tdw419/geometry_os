; DESCRIPTION: Composite: Draws a cyan rectangle at (151, 16) with width 101 and height 114 then Renders a purple line between points (384, 172) and (372, 164) then Renders a yellow disk with center (285, 77) and radius 69.
; PLAN: r0=151(x), r1=16(y), r2=101(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=384(x1), r6=172(y1), r7=372(x2), r8=164(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=285(x), r11=77(y), r12=69(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 151
LDI r1, 16
LDI r2, 101
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 384
LDI r6, 172
LDI r7, 372
LDI r8, 164
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 285
LDI r11, 77
LDI r12, 69
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
