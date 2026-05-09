; DESCRIPTION: Composite: Renders a yellow line between points (143, 159) and (80, 207) then Renders a orange disk with center (222, 178) and radius 57 then Renders a purple box of size 36x118 starting at (4, 75).
; PLAN: r0=143(x1), r1=159(y1), r2=80(x2), r3=207(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=222(x), r6=178(y), r7=57(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=4(x), r11=75(y), r12=36(width), r13=118(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 143
LDI r1, 159
LDI r2, 80
LDI r3, 207
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 178
LDI r7, 57
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 4
LDI r11, 75
LDI r12, 36
LDI r13, 118
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
