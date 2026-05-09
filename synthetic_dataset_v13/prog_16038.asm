; DESCRIPTION: Composite: Draws a magenta rectangle at (236, 129) with width 117 and height 38 then Places a yellow circle of radius 56 at center (101, 56) then Renders a purple line between points (425, 81) and (210, 109).
; PLAN: r0=236(x), r1=129(y), r2=117(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=101(x), r6=56(y), r7=56(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=425(x1), r11=81(y1), r12=210(x2), r13=109(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 236
LDI r1, 129
LDI r2, 117
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 56
LDI r7, 56
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 425
LDI r11, 81
LDI r12, 210
LDI r13, 109
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
