; DESCRIPTION: Composite: Renders a purple line between points (483, 10) and (183, 146) then Places a yellow 80x120 rectangle at position (237, 73) then Places a red circle of radius 59 at center (222, 105).
; PLAN: r0=483(x1), r1=10(y1), r2=183(x2), r3=146(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=237(x), r6=73(y), r7=80(width), r8=120(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=222(x), r11=105(y), r12=59(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 483
LDI r1, 10
LDI r2, 183
LDI r3, 146
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 73
LDI r7, 80
LDI r8, 120
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 222
LDI r11, 105
LDI r12, 59
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
