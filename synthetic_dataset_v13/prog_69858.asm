; DESCRIPTION: Composite: Renders a orange box of size 80x12 starting at (420, 96) then Renders a purple line between points (439, 210) and (435, 118) then Draws a orange circle centered at (262, 141) with radius 19.
; PLAN: r0=420(x), r1=96(y), r2=80(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=439(x1), r6=210(y1), r7=435(x2), r8=118(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=262(x), r11=141(y), r12=19(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 420
LDI r1, 96
LDI r2, 80
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 210
LDI r7, 435
LDI r8, 118
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 262
LDI r11, 141
LDI r12, 19
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
