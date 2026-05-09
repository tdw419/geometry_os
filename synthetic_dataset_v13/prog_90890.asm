; DESCRIPTION: Composite: Draws a yellow rectangle at (96, 138) with width 89 and height 74 then Places a green circle of radius 71 at center (209, 105) then Renders a red line between points (93, 117) and (39, 173).
; PLAN: r0=96(x), r1=138(y), r2=89(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=209(x), r6=105(y), r7=71(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=93(x1), r11=117(y1), r12=39(x2), r13=173(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 96
LDI r1, 138
LDI r2, 89
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 105
LDI r7, 71
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 93
LDI r11, 117
LDI r12, 39
LDI r13, 173
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
