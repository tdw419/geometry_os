; DESCRIPTION: Composite: Places a red circle of radius 71 at center (114, 158) then Draws a magenta rectangle at (147, 129) with width 99 and height 105 then Renders a cyan line between points (113, 28) and (505, 56).
; PLAN: r0=114(x), r1=158(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=147(x), r6=129(y), r7=99(width), r8=105(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=113(x1), r11=28(y1), r12=505(x2), r13=56(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 114
LDI r1, 158
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 147
LDI r6, 129
LDI r7, 99
LDI r8, 105
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 113
LDI r11, 28
LDI r12, 505
LDI r13, 56
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
