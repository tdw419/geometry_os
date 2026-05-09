; DESCRIPTION: Composite: Draws a blue line from (494, 139) to (192, 168) then Draws a orange rectangle at (112, 183) with width 26 and height 51 then Renders a purple disk with center (246, 139) and radius 73.
; PLAN: r0=494(x1), r1=139(y1), r2=192(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=112(x), r6=183(y), r7=26(width), r8=51(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=246(x), r11=139(y), r12=73(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 494
LDI r1, 139
LDI r2, 192
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 183
LDI r7, 26
LDI r8, 51
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 246
LDI r11, 139
LDI r12, 73
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
