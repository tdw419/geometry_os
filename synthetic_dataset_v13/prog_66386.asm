; DESCRIPTION: Composite: Renders a blue line between points (58, 167) and (119, 228) then Places a yellow 28x71 rectangle at position (15, 91) then Renders a purple disk with center (123, 95) and radius 20.
; PLAN: r0=58(x1), r1=167(y1), r2=119(x2), r3=228(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=15(x), r6=91(y), r7=28(width), r8=71(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=123(x), r11=95(y), r12=20(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 58
LDI r1, 167
LDI r2, 119
LDI r3, 228
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 15
LDI r6, 91
LDI r7, 28
LDI r8, 71
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 123
LDI r11, 95
LDI r12, 20
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
