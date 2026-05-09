; DESCRIPTION: Composite: Draws a green line from (268, 93) to (204, 80) then Renders a purple disk with center (161, 164) and radius 56 then Draws a magenta rectangle at (74, 170) with width 12 and height 81.
; PLAN: r0=268(x1), r1=93(y1), r2=204(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=161(x), r6=164(y), r7=56(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=74(x), r11=170(y), r12=12(width), r13=81(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 268
LDI r1, 93
LDI r2, 204
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 164
LDI r7, 56
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 74
LDI r11, 170
LDI r12, 12
LDI r13, 81
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
