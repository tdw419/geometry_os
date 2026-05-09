; DESCRIPTION: Composite: Renders a black disk with center (434, 73) and radius 68 then Draws a purple line from (167, 110) to (179, 183) then Draws a red rectangle at (406, 143) with width 10 and height 51.
; PLAN: r0=434(x), r1=73(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=167(x1), r6=110(y1), r7=179(x2), r8=183(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=406(x), r11=143(y), r12=10(width), r13=51(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 434
LDI r1, 73
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 167
LDI r6, 110
LDI r7, 179
LDI r8, 183
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 406
LDI r11, 143
LDI r12, 10
LDI r13, 51
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
