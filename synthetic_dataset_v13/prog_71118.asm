; DESCRIPTION: Composite: Draws a white rectangle at (178, 108) with width 10 and height 110 then Places a white circle of radius 62 at center (182, 95) then Renders a purple line between points (156, 106) and (191, 177).
; PLAN: r0=178(x), r1=108(y), r2=10(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=182(x), r6=95(y), r7=62(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=156(x1), r11=106(y1), r12=191(x2), r13=177(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 178
LDI r1, 108
LDI r2, 10
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 95
LDI r7, 62
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 156
LDI r11, 106
LDI r12, 191
LDI r13, 177
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
